class Venue < ActiveRecord::Base

  def self.find_or_create_by_event(event)
    # first find_by songkick venue id else search and try and create
    location = "#{event[:latitude]},#{event[:longitude]}"
    search = Place.new({location: location, name: event[:venue]})
    place_details = search.place_result
    if place_details
      self.create_with_place(place_details)
    end
  end

  def self.create_with_place(venue)
    res = venue["result"]
    place = self.new(
      address: res["formatted_address"],
      phone: res["formatted_phone_number"],
      latitude: res["geometry"]["location"]["lat"],
      longitude: res["geometry"]["location"]["lng"],
      rating: res["rating"],
      total_ratings: res["user_ratings_total"],
      google_url: res["url"]
      # add songkick id, push to events, make sure to grab the photo
      )
    binding.pry
    # figure out how to return image_url or call on the front end, encrypted response
    if res["photos"]
      place.photo = Place.get_photo(res["photos"][0]["photo_reference"])
    end
    place.save ? place : nil
  end

end
