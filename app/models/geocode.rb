class Geocode

  include HTTParty

  base_uri "https://maps.googleapis.com/maps/api/geocode"

  attr_accessor :query, :current_response

  def initialize(address_params)
    @query = address_params
    @current_response = ""
  end

  def location_get
    self.current_response = self.class.get("/json",:query => query)
  end

  def valid_response?
    !current_response.empty? || current_response.code != 200
  end

  def get_lat_lon_hash
    first_response = current_response["results"][0]
    first_response["geometry"]["location"]
  end

end
