class SongkickController < ApplicationController

  def events
    if current_user
      events = Songkick.new
      events.add_location
      render json: events.location_return
    end
  end

  def custom_search
    events = Songkick.new

    if params[:location].length > 0

      geocode = Geocode.new(address: params[:location])
      geocode.location_get

      if geocode.valid_response?
        latlng = geocode.get_lat_lon_hash
        lat = latlng["lat"]
        lng = latlng["lng"]
        events.add_location(lat,lng)
      else
        flash[:notice] = "address entered was not valid, try to be more specific"
        binding.pry
        redirect_to root_path
      end

    else
      events.add_location
    end

    start_date = params[:date][:min_date]
    end_date = params[:date][:max_date]
    events.add_dates(start_date,end_date)
    render json: events.location_return
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
