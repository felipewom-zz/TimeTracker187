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


    end
  end
end
