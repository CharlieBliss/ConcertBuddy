class GroupsController < ApplicationController

  def new
    @group = Group.new
    @event = Event.find_by(id: params[:event_id])
  end

  def create
    binding.pry
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
    render partial: '/groups/groups', layout: false
  end

  def show
    @group = Group.find_by(id: params[:group_id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :size).merge(owner: current_user)
  end

end
