class Venue < ActiveRecord::Base

  def self.build_and_return_unsaved(res)

      res = res["result"]
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
      place
  end

end
