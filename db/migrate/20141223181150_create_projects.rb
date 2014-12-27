class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string    :name
      t.string    :status
      t.string    :area
      t.string    :url
      t.boolean   :completed,        :default => false
      t.decimal   :hourly_rate,      :precision => 10, :scale => 2, :default => 0.0
      t.integer   :client_id
      t.integer   :owner_id
      t.text :description
      t.text :whiteboard
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps


    end
  end
end
