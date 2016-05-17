class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :spotify_url
      t.string :genre
      t.string :spotify_id
      t.string :image_url
      t.string :name
      t.references :event

      t.timestamps null: false
    end
  end
end
