class AddSearchedForArtistToEvent < ActiveRecord::Migration
  def change
    add_column :events, :searched_for_artist, :boolean
  end
end
