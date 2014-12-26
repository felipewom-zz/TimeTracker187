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

      add_index "projects", ["client_id"], :name => "index_projects_on_client_id"
      add_index "projects", ["completed"], :name => "index_projects_on_completed"
      add_index "projects", ["end_date"], :name => "index_projects_on_end_date"
      add_index "projects", ["owner_id"], :name => "index_projects_on_owner_id"
      add_index "projects", ["start_date"], :name => "index_projects_on_start_date"
      add_index "projects", ["url"], :name => "index_projects_on_url"
    end
  end
end
