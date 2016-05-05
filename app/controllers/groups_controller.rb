class GroupsController < ApplicationController

  def new
    @group = Group.new
    @event = Event.find_by(id: params[:event_id])
  end

  def create
    binding.pry
    puts 'hey'
  end

  def show
    @group = Group.find_by(id: params[:group_id])
  end

end
