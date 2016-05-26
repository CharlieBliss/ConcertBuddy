class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    @artist = @event.artists.first
    @groups = @event.groups
    if request.xhr?
      render '/events/show', layout: false, locals: {event: @event,
                                              artist: @artist,
                                              groups: @groups}
    end
  end

  def create
    @event = Event.find_by(event_id: event_params[:event_id]) || Event.create(event_params)
    if @event
      render partial: "groups/form", locals: {event: @event, group: Group.new }
    else
      flash["notice"] = "error occurred"
    end

  end

  def index
    @songkick = Songkick.new
    @events = Event.all

    if request.xhr?
      render @events
    end

  end

  def has_groups
    events = []
    Group.find_each {|group| events << group.event }
    render json: events
  end

  private

  def event_params
    params.require(:show).permit(:title, :url, :venue, :event_id, :city, :latitude, :longitude, :time, :date)
  end

end
