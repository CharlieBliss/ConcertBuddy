class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :url, null: false
      t.string :name, null: false
      t.datetime :start
      t.string :address
      t.string :city
      t.string :latitude
      t.string :longitude
      t.text :html
      t.text :text

      t.timestamps null: false
    end
  end
end
