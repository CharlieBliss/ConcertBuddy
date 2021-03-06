class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :event_id, index: true, null: false
      t.string :name, limit: 50
      t.integer :size, limit: 2, null: false
      t.integer :owner_id, index: true, null: false

      t.timestamps null: false
    end
  end
end
