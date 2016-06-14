 class Place

include HTTParty

  base_uri "https://maps.googleapis.com/maps/api/place"

  attr_accessor :query, :current_response

  # http://localhost:3000/venues/search?name=saint%20vitus&latitude=40.736769&longitude=-73.954998 search params for venue

  def initialize(venue_params)
    @query = venue_params
    @query["key"] = ENV["GOOGLE_PLACES_KEY"]
    @current_response = ""
  end

  def location_get
    self.query["radius"] = 500
    self.current_response = self.class.get("/nearbysearch/json",:query => query)
  end

  def find_specific_location
    res = location_get
    res['results'].each do |result|
      # includes portion of match
      if @query[:name].match(/#{result["name"]}/i)
        return result["place_id"]
      end
    end
    nil
  end

  def place_result
    place_id = find_specific_location
    return self.class.place_return(place_id) if place_id
  end

  def self.place_return(place_id)
    HTTParty.get(base_uri + "/details/json", :query => {placeid: place_id, key: ENV["GOOGLE_PLACES_KEY"]})
  end

  def valid_response?
    !current_response.empty? || current_response.code != 200
  end

end
