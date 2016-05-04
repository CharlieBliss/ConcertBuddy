class Eventbrite
  include HTTParty

    base_uri "https://www.eventbriteapi.com/v3"

    attr_accessor :query, :headers

    def initialize(token,latitude=40.7829,
      longitude=-73.9654)
      @query = {"token" => token, "location.latitude" => latitude, "location.longitude" => longitude}
    end

    def events
      self.class.get("/events/search/", :query => query, :headers => headers)
    end

end