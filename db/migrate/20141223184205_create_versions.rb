class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :item_type, :null => false
      t.integer :item_id, :null => false
      t.string :event, :null => false
      t.text :object
      t.string :object_changes

      t.timestamps

    end
  end
end
