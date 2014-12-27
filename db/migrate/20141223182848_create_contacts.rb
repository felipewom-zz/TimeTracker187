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



    end
  end
end
