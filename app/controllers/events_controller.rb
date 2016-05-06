class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    @groups = @event.groups
  end

  def index

    @events = Event.paginate(page: params[:page], per_page: 15).where('start >= ?',Time.now).order('start ASC')

    if request.xhr?
      render @events
    end

  end

  def paginate_events
    binding.pry
  end

end
