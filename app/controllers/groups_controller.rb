class GroupsController < ApplicationController

  def new
    @group = Group.new
    @event = Event.find_by(id: params[:event_id])
  end

  def create
    @group = Group.new(group_params)
    @group.event = Event.find_by(id: params[:event_id])
    if @group.save
      redirect_to user_path(@current_user)
    else
      flash[:notice] = "There was an error saving your group. Please try again."
      redirect_to new_event_group_path
    end
  end

  def index
    event = Event.find(params[:event_id])
    @groups = event.groups
  end

  def show
    @group = Group.find_by(id: params[:id])
    @attendees = @group.users
  end

  def join
    @group = Group.find_by(id: params[:group_id])
    # fix to not allow for double adding to group
    if current_user
      if @group.users.pluck(:id).include?(current_user.id)
        flash[:notice] = "You are already a member"
      else
        @group.users << current_user
        flash[:notice] = "Successfully joined #{@group.name}"
      end
    else
      flash[:notice] = "must be logged in to join a group"
    end
    redirect_to :back
  end


  private

  def group_params
    params.require(:group).permit(:name, :size).merge(owner: current_user)
  end

end
