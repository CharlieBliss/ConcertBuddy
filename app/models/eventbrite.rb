class Eventbrite
  include HTTParty

    base_uri "https://www.eventbriteapi.com/v3"

    attr_accessor :query, :headers

    def initialize(token, params = {})
      @query = {
        "token" => token,
        "location.latitude" => params[:latitude] || 40.7829,
        "location.longitude" => params[:longitude] || -73.9654,
        "page" => params[:page] || 1,
        "categories" => params[:category_id] || 103,
        "expand" => "venue",
        "sort_by" => "date",
        "popular" => true
      }
    end

    def events_response
      self.class.get("/events/search/", :query => query, :headers => headers)
    end

    def create_events
      res = nil
      until res && self.query["page"] > res["pagination"]["page_count"]
        res = events_response
        res["events"].each do |event|
          new_event = Event.new(
            provider_id: 1,
            url: event["url"],
            name: event["name"]["text"],
            description: event["description"]["text"],
            start: event["start"]["local"],
            address: event["venue"]["address"]["address_1"],
            latitude: event["venue"]["address"]["latitude"],
            longitude: event["venue"]["address"]["longitude"],
            venue: event["name"],
            event_id: event["id"],
            )
          if event["logo"] && event["logo"]["url"]
            new_event.logo_url = event["logo"]["url"]
          end
          new_event.save
        end
        self.query["page"] += 1
      end
    end

end