class GroupsController < ApplicationController

  def new
    @group = Group.new
    @event = Event.find_by(id: params[:event_id])
  end

  def create

  end

  def show
    @group = Group.find_by(id: params[:group_id])
  end

end
