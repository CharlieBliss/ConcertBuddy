class Songkick
include HTTParty

    base_uri "https://www.eventbriteapi.com/v3"

    attr_accessor :query, :headers

    def initialize(token,latitude=40.7829,longitude=-73.9654)
      @query = {
        "token" => token,
        "location.latitude" => latitude,
        "location.longitude" => longitude,
        "categories" => 102,
        "expand" => "venue",
        "sort_by" => "date",
        "popular" => true
      }
    end
end