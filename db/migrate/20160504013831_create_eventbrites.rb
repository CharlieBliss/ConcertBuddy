class CreateEventbrites < ActiveRecord::Migration
  def change
    create_table :eventbrites do |t|

      t.timestamps null: false
    end
  end
end
