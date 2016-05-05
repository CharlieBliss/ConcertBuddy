class EventsController < ApplicationController

  # def get_events
  #   # @event = Event.find(params[:id])

  #   jsondata = JSON.parse(params[:data])
  #   jsondata.each do |event|
  #     event = Event.new(url: event["url"], name: event["name"], start: event["start"], address: event["address"], eventbrite_id: event["id"])
  #     event.save
  #   end
  # end

  # def index
  #   binding.pry
  # end


  def show
    @event = Event.find(params[:id])
    @groups = @event.groups
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
