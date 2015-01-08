class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :project_id
      t.integer :task_id
      t.integer :user_id
      t.integer :ticket_id
      t.integer :watcher_id
      t.date    :historic_date
      t.string  :start
      t.string  :finish
      t.decimal :duration, :precision => 19, :scale => 4
      t.decimal :additional_cost, :precision => 19, :scale => 4
      t.text :description

      t.timestamps

    end
  end
end
