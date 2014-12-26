class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :project_id
      t.integer :task_id
      t.integer :user_id
      t.datetime :start
      t.datetime :finish
      t.decimal :duration
      t.decimal :additional_cost
      t.text :description

      t.timestamps
    end
  end
end
