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
            # binding.pry
            if saved_event && saved_event.groups.length > 0
                [saved_event,true]
            else
                [new_event = Event.new(
                url: event["uri"],
                title: event["displayName"],
                venue: event["venue"]["displayName"],
                event_id: event["id"],
                city: event["location"]["city"],
                latitude: event["location"]["lat"],
                longitude: event["location"]["lng"],
                time: event["start"]["time"],
                date: event["start"]["date"]
                ),false]
            end
        end
        arr_map
    end

    def base_user_calendar(username)
        self.class.get("/users/#{username}/calendar.json?", :query => query)
    end


    def location_events
        base_events["resultsPage"]["results"]["event"]
    end

    def return_personal_reccomendations

    end


end