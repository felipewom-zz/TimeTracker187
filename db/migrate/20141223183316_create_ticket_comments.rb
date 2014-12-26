class CreateTicketComments < ActiveRecord::Migration
  def change
    create_table :ticket_comments do |t|
      t.text :body
      t.integer :version_id
      t.integer :ticket_id

      t.timestamps
    end
  end
end
