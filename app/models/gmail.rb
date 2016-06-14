class Gmail

include HTTParty

  base_uri "https://www.googleapis.com/gmail/v1/"

  attr_accessor :query

  def initialize(params)
    @query = params
    @query["key"] = ENV["GOOGLE_PLACES_KEY"]
  end

end