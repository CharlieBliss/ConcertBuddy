class GroupsController < ApplicationController

  def join
    @group = Group.find_by(id: params[:group_id])
    # fix to not allow for double adding to group
    if current_user
      if @group.users.pluck(:id).include?(current_user.id)
        flash[:notice] = "You are already a member"
      elsif @group.owner == current_user
        flash[:notice] = "you are the owner of this group"
      else
        @group.users << current_user
        flash[:notice] = "Successfully joined #{@group.name}"
      end
    else
      flash[:notice] = "must be logged in to join a group"
    end
    redirect_to :back
  end

  def new
    @group = Group.new
    @event = Event.find_by(id: params[:event_id])
    if request.xhr?
      render '/groups/new', layout: false, locals: {event: @event,
                                                    group: @group}
      end
  end

  def create

    unless current_user
      flash[:notice] = "You must be logged in to create a group"
      redirect_to root_path
      return
    end

    @group = Group.new(group_params)
    @group.event = Event.find_by(id: params[:event_id])
    if @group.save
      UserMailer.new_group_email(@group.owner,@group).deliver_now
      redirect_to user_path(@current_user)
    else
      flash[:notice] = "There was an error saving your group. Please try again."
      redirect_to new_event_group_path
    end
  end

  def index

    event = Event.find(params[:event_id])
    @groups = event.groups
     if request.xhr?
      render '/groups/index', layout: false, locals: {event: @event,
                                                     groups: @groups}
    end
  end

  def show
    @group = Group.find_by(id: params[:id])
    @event = Event.find(@group.event_id)
    @attendees = @group.users
    @message = Message.new
  end



  private

  def group_params
    params.require(:group).permit(:name, :size).merge(owner: current_user)
  end

end
