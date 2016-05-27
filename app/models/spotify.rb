class Spotify
  include HTTParty

  def self.get_artist(artist)
    query = {
      q: artist,
      type: "artist",
      limit: 5
    }
    get("https://api.spotify.com/v1/search",query: query)
  end

  def self.artist_match(artist)
    response = get_artist(artist)
    search_artist = artist.downcase

    return nil if response["artists"]["items"].empty?

    response["artists"]["items"].each do |item|
      return item if item["name"].downcase.match(search_artist)
    end

    nil

  end

  def self.create_artist_info(artist)
    res = artist_match(artist)
    if res
      new_artist = Artist.new(spotify_id: res["spotify_id"], name: res["name"])
      new_artist.spotify_url = res["external_urls"]["spotify"] if res["external_urls"] && res["external_urls"]["spotify"]
      new_artist.genre = res["genres"][0] if res["genres"].any?
      new_artist.image_url = grab_best_image(res["images"]) if res["images"]
      return new_artist if new_artist.save
    end
    nil
  end

  def self.grab_best_image(images)
    return nil if images.empty?
    images.length > 2 ? images[-2]["url"] : images[0]["url"]
  end

end
