class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :status_id
      t.text :description
      t.string :url
      t.integer :contact_id
      t.decimal  "hourly_rate",    :precision => 10, :scale => 2, :default => 0.0

      t.timestamps


    end
  end
end
