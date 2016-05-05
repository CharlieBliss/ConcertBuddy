class Eventbrite
  include HTTParty

    base_uri "https://www.eventbriteapi.com/v3"

    attr_accessor :query, :headers

    def initialize(token,latitude=40.7829,longitude=-73.9654)
      @query = {"token" => token, "location.latitude" => latitude, "location.longitude" => longitude, "expand" => "venue"}
    end

    def events_response
      self.class.get("/events/search/", :query => query, :headers => headers)["events"]
    end

    def create_events
      events_response.each do |event|
        new_event = Event.new(
          url: event["url"],
          name: event["name"]["text"],
          description: event["description"]["text"],
          start: event["start"]["local"],
          address: event["venue"]["address"]["address_1"],
          latitude: event["venue"]["address"]["latitude"],
          longitude: event["venue"]["address"]["longitude"],
          venue: event["name"],
          eventbrite_id: event["id"],
          logo_url: event["logo"]["url"]
          )
        new_event.save
      end
    end

end