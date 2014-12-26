class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer  :addressable_id
      t.string :client_id
      t.string :cellphone
      t.string :phone_number

      t.timestamps

      add_index "contacts", ["addressable_id"], :name => "index_contacts_on_addressable_id"
      add_index "contacts", ["client_id"], :name => "index_contacts_on_client_id"

    end
  end
end
