class CreateUsersTags < ActiveRecord::Migration
  def change
    create_table :users_tags do |t|
      t.integer :tag_id, null: false
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
