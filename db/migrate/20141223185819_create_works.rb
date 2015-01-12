class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :project_id
      t.integer :task_id
      t.integer :user_id
      t.integer :ticket_id
      t.integer :watcher_id
      t.date    :historic_date
      t.string  :historic_start
      t.string  :historic_finish
      t.decimal :historic_duration, :precision => 19, :scale => 0
      t.decimal :additional_cost, :precision => 19, :scale => 0
      t.text :description

      t.timestamps

    end
  end
end
