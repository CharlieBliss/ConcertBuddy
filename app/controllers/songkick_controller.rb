class SongkickController < ApplicationController

  def events
    events = Songkick.new
    events.add_location
    render json: events.location_return
  end

  def custom_search
    events = Songkick.new

    if params[:location].length > 0

      geocode = Geocode.new(address: params[:location])
      geocode.location_get

      if geocode.valid_response?
        latlng = geocode.get_lat_lon_hash
        events.add_location(latlng["lat"],latlng["lng"])
        events.add_dates(params[:date][:min_date],params[:date][:max_date])
        render json: events.location_return
      else
        render json: "res: no results"
      end

    else
        events.add_location(latlng["lat"],latlng["lng"])
        events.add_dates(params[:date][:min_date],params[:date][:max_date])
        render json: events.location_return
    end

  end

  def artist_search
    artist_search = Songkick.new
    artist_id = artist_search.artist_match(params[:artist])
    if artist_id
      artist_search.remove_query
      render json: artist_search.search_artist_id(artist_id)
    end
  end


end
