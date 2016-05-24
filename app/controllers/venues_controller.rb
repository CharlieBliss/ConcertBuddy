class VenuesController < ApplicationController

  def search
    location = params[:latitude] + "," + params[:longitude]
    venue_params = {name: params[:name], location: location}
    venue_search = Place.new(venue_params)
    res = venue_search.place_result
    venue = Venue.build_and_return_unsaved(res)
    render json: venue
  end

end
