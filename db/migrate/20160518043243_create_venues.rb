class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :address
      t.string :phone
      t.string :latitude
      t.string :longitude
      t.integer :rating
      t.integer :total_ratings
      t.string :photo
      t.string :google_url
      t.string :email

      t.timestamps null: false
    end
  end
end
