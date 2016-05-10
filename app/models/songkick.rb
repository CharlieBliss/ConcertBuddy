class Songkick
include HTTParty

    base_uri "http://api.songkick.com/api/3.0"


    attr_accessor :query
    # latitude=40.7829,longitude=-73.9654
    def initialize(lat=40.7096613,lon=-73.9611627)
      @query = {
        "apikey" => "tnIoiwzydaoUPOrR",
        "location" => "geo:#{lat},#{lon}"
      }
    end

    def base_events
        self.class.get("/events.json?", :query => query)
    end

    def location_events
        base_events["resultsPage"]["results"]["event"]
    end

    def self.create_events
        a = self.new
        res = a.location_events
        res.each do |event|
            new_event = Event.new(
            provider_id: 2,
            url: event["uri"],
            name: event["displayName"],
            venue: event["venue"]["displayName"],
            event_id: event["id"],
            city: event["location"]["city"],
            latitude: event["location"]["lat"],
            longitude: event["location"]["lng"]
            )
            new_event.start = event["start"]["datetime"] ? event["start"]["datetime"] : event["start"]["date"]
            new_event.save
        end



    end

end