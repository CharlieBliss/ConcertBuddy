class GroupsController < ApplicationController

  def new
    @group = Group.new
    @event = Event.find_by(id: params[:event_id])
  end

  def create
    @group = Group.new(group_params)
    @group.event = Event.find_by(id: params[:event_id])
    if @group.save
      redirect_to event_group_path(@group, @group.event)
    else
      binding.pry
    end
  end

  def show
    @group = Group.find_by(id: params[:group_id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :size).merge(owner: current_user)
  end

end
