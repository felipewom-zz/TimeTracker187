class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :item_type
      t.integer :item_id
      t.string :event
      t.text :object
      t.string :object_changes

      t.timestamps
    end
  end
end
