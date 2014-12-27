class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :project_id
      t.integer :task_id
      t.integer :user_id
      t.integer :ticket_id
      t.integer :watcher_id
      t.datetime :start
      t.datetime :finish
      t.decimal :duration, :precision => 19, :scale => 4
      t.decimal :additional_cost, :precision => 19, :scale => 4
      t.text :description

      t.timestamps


      add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"
      add_index "tickets", ["assignee_id"], :name => "index_tickets_on_assignee_id"
      add_index "tickets", ["billable"], :name => "index_tickets_on_billable"
      add_index "tickets", ["end_date"], :name => "index_tickets_on_end_date"
      add_index "tickets", ["project_id"], :name => "index_tickets_on_project_id"
      add_index "tickets", ["start_date"], :name => "index_tickets_on_start_date"
      add_index "tickets", ["status_id"], :name => "index_tickets_on_status_id"
      add_index "tickets", ["ticket_category_id"], :name => "index_tickets_on_ticket_category_id"
      add_index "tickets", ["ticket_priority_id"], :name => "index_tickets_on_ticket_priority_id"

      add_index "ticket_statuses", ["active"], :name => "index_ticket_statuses_on_active"
      add_index "ticket_comments", ["ticket_id"], :name => "index_ticket_comments_on_ticket_id"
      add_index "ticket_comments", ["version_id"], :name => "index_ticket_comments_on_version_id"
      add_index "members_projects", ["user_id"], :name => "index_members_projects_on_user_id"
      add_index "members_projects", ["project_id"], :name => "index_members_projects_on_project_id"
      add_index "contacts", ["addressable_id"], :name => "index_contacts_on_addressable_id"
      add_index "contacts", ["client_id"], :name => "index_contacts_on_client_id"
      add_index "addresses", ["type", "addressable_id"], :name => "index_addresses_on_addressable_type_and_addressable_id"
      add_index "clients", ["addressable_id"], :name => "index_clients_on_addressable_id"
      add_index "clients", ["url"], :name => "index_clients_on_url"
      add_index "users_teams", ["user_id"], :name => "index_users_teams_on_user_id"
      add_index "users_teams", ["team_id"], :name => "index_users_teams_on_team_id"
      add_index "projects", ["client_id"], :name => "index_projects_on_client_id"
      add_index "projects", ["completed"], :name => "index_projects_on_completed"
      add_index "projects", ["end_date"], :name => "index_projects_on_end_date"
      add_index "projects", ["owner_id"], :name => "index_projects_on_owner_id"
      add_index "projects", ["start_date"], :name => "index_projects_on_start_date"
      add_index "projects", ["url"], :name => "index_projects_on_url"
    end
  end
end
