class EventsController < ApplicationController

  def create

  end

  def get_events
    binding.pry
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    # num_photos = 10
    # 'https://www.eventbriteapi.com/v3/events/search/?token='+token+'&venue.city=new+york&expand=venue'
    # # "https://www.eventbriteapi.com/v3/events/search/?token='+ZRZ2ELU45C2X5UVCKE"
    # binding.pry
    # will eventually be the events for that user on this call based on location
    @events = Event.all
  end

end
