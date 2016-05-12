class SongkickController < ApplicationController

  def events
    events = Songkick.new
    events.add_location
    render json: events.location_return
  end

  def custom_search
    binding.pry
    events = SongKick.new

  end


end
