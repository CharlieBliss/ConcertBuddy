class Songkick
include HTTParty

    base_uri "http://api.songkick.com/api/3.0"


    attr_accessor :query

    def initialize
      @query = { "apikey" => ENV["SONGKICK_API_KEY"]}
    end

    def add_location(lat=40.7096613,lon=-73.9611627)
        self.query["location"] = "geo:#{lat},#{lon}"
    end

    def add_dates(min_date, max_date)
      self.query["min_date"] = min_date
      self.query["max_date"] = max_date
    end

    def location_request
        self.class.get("/events.json?", :query => self.query)
    end

    def location_return
        res = location_request
        arr_map = res["resultsPage"]["results"]["event"].map do |event|
          if Event.find_by(event_id: event["id"])
            Event.find_by(event_id: event["id"])
          else
            Event.create_with_songkick(event)
          end
        end
        arr_map
    end

    def self.headliner(event)
      event["performance"].each {|perf| return perf["artist"]["displayName"] if perf["billingIndex"] == 1}
      nil
    end

    def base_user_calendar(username)
      self.class.get("/users/#{username}/calendar.json?", :query => query)
    end


    def location_events
      base_events["resultsPage"]["results"]["event"]
    end

end