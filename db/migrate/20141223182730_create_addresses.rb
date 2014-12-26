class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer  :addressable_id
      t.string :type
      t.string :street
      t.string :complement
      t.string :city
      t.string :state,            :limit => 2
      t.string :postal_code
      t.string :neighbourhood

      t.timestamps

      add_index "addresses", ["type", "addressable_id"], :name => "index_addresses_on_addressable_type_and_addressable_id"
    end
  end
end
