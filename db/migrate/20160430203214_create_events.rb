class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :url, null: false
      t.string :title, null: false
      t.text :description
      t.string :address
      t.string :city
      t.string :event_id
      t.string :latitude, precision: 7
      t.string :longitude, precision: 7
      t.string :venue
      t.integer :songkick_artist_id
      t.integer :songkick_venue_id
      t.string :artist_name
      t.time :time
      t.date :date
      t.text :logo_url
      t.references :artist

      t.timestamps null: false
    end
  end
end
