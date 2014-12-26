class CreateTicketPriorities < ActiveRecord::Migration
  def change
    create_table :ticket_priorities do |t|
      t.string :name
      t.string :weight

      t.timestamps
    end
  end
end
