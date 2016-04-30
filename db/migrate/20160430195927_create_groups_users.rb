class CreateGroupsUsers < ActiveRecord::Migration
  def change
    create_table :groups_users do |t|
      t.integer :group_id, null: false, index: true
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
