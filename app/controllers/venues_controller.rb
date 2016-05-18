class VenuesController < ApplicationController

  def search
    location = params[:latitude] + "," + params[:longitude]
    venue_params = {name: params[:name], location: location}
    venue_search = Venue.new(venue_params)
    binding.pry
  end
end
