class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :url, null: false
      t.string :name, null: false
      t.text :description
      t.datetime :start
      t.string :address
      t.string :eventbrite_id
      t.string :latitude, precision: 7
      t.string :longitude, precision: 7
      t.string :venue
      t.text :logo_url

      t.timestamps null: false
    end
  end
end
