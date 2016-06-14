class SongkickController < ApplicationController

  def events
    events = Songkick.new

    events.add_location
    render json: events.location_return
  end

  def custom_search
    events = Songkick.new
    events.add_dates(params[:date][:min_date],params[:date][:max_date])

    if params[:location].length > 0

      geocode = Geocode.new(address: params[:location])
      geocode.location_get

      if geocode.valid_response?
        latlng = geocode.get_lat_lon_hash
        events.add_location(latlng["lat"],latlng["lng"])
      else
        render text: "<h2>did not recognize location</h2>"
        return
      end
    else
      events.add_location
    end

    location_objects = events.location_return

    if location_objects
      render json: events.location_return
    else
      render text: "<h2 style>Did not return any results, try changing the dates</h2>"
    end

  end

  def artist_search
    artist_search = Songkick.new
    artist_id = artist_search.artist_match(params[:artist])
    if artist_id
      artist_search.remove_query
      response = artist_search.search_artist_id(artist_id)

      if response
        render json: response
      else
        render text: "<h2>No upcoming concerts for #{params[:artist]}</h2>"
      end

    else
      render text: "<h2>No artist matched that search</h2>"
    end

  end


end
