class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :ticket_category_id
      t.integer :assignee_id
      t.integer :status_id
      t.decimal :estimated_time
      t.decimal :actual_time
      t.boolean :billable
      t.integer :ticket_priority_id
      t.integer :project_id
      t.decimal :budget_progress

      t.timestamps
    end
  end
end
