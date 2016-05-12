class Songkick
include HTTParty

    base_uri "http://api.songkick.com/api/3.0"


    attr_accessor :query

    def initialize
      @query = { "apikey" => "tnIoiwzydaoUPOrR"}
    end

    def add_location(lat=40.7096613,lon=-73.9611627)
        self.query["location"] = "geo:#{lat},#{lon}"
    end

    def location_request
        self.class.get("/events.json?", :query => self.query)
    end

    def location_return
        res = location_request
        arr_map = res["resultsPage"]["results"]["event"].map do |event|
          saved_event = Event.find_by(event_id: event["id"])
          if saved_event
            [saved_event,saved_event.has_groups]
          else
            [location_event_construct(event), false]
          end
        end
        arr_map
    end

    def headliner(event)
      event["performance"].each {|perf| return perf["artist"]["displayName"] if perf["billingIndex"] == 1}
      nil
    end

    def location_event_construct(event)
      new_event = Event.create(
        url: event["uri"],
        title: event["displayName"],
        venue: event["venue"]["displayName"],
        event_id: event["id"],
        city: event["location"]["city"],
        latitude: event["location"]["lat"],
        longitude: event["location"]["lng"],
        time: event["start"]["time"],
        date: event["start"]["date"],
        artist: headliner(event)
        )
    end

    def base_user_calendar(username)
      self.class.get("/users/#{username}/calendar.json?", :query => query)
    end


    def location_events
      base_events["resultsPage"]["results"]["event"]
    end

end