class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :ticket_category_id
      t.integer :user_id
      t.integer :status_id
      t.decimal :estimated_time, :precision => 19, :scale => 4, :default => 0.0
      t.decimal :actual_time, :precision => 19, :scale => 4, :default => 0.0
      t.boolean :billable, :default => true
      t.integer :ticket_priority_id
      t.integer :project_id
      t.decimal :budget_progress, :precision => 19, :scale => 4

      t.timestamps

    end
  end
end
