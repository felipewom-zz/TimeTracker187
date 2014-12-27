class CreateTicketComments < ActiveRecord::Migration
  def change
    create_table :ticket_comments do |t|
      t.text :body
      t.integer :version_id
      t.integer :ticket_id
      t.decimal :time, :precision => 19, :scale => 4

      t.timestamps


    end
  end
end
