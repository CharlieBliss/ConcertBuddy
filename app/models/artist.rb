class Artist < ActiveRecord::Base
  has_and_belongs_to_many :events

  def self.find_or_create(artist_name)
    Artist.where('lower(name) = ?', artist_name.downcase).first || Spotify.create_artist_info(artist_name)
  end
end
