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
        json_hash = {}
        count = 1
        res["resultsPage"]["results"]["event"].each do |event|
            json_hash[count] = {}
            json_hash[count][:url] = event["uri"]
            json_hash[count][:name] = event["displayName"]
            json_hash[count][:venue] = event["venue"]["displayName"]
            json_hash[count][:event_id] = event["id"]
            json_hash[count][:city] = event["location"]["city"]
            json_hash[count][:latitude] = event["location"]["lat"],
            json_hash[count][:longitude] = event["location"]["lng"]
            if event["start"]["datetime"]
                json_hash[count][:start] = event["start"]["datetime"]
            else
             json_hash[count][:start] = event["start"]["date"]
            end
            count += 1
        end
        json_hash
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