class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :status
      t.text :description
      t.string :url
      t.integer :addressable_id
      t.decimal  "hourly_rate",    :precision => 10, :scale => 2, :default => 0.0

      t.timestamps

      add_index "clients", ["addressable_id"], :name => "index_clients_on_addressable_id"
      add_index "clients", ["url"], :name => "index_clients_on_url"
    end
  end
end
