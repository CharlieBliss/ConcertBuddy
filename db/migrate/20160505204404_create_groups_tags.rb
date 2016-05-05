class CreateGroupsTags < ActiveRecord::Migration
  def change
    create_table :groups_tags do |t|
      t.integer :tag_id, null: false
      t.integer :group_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
