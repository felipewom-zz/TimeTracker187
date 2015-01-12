# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150106142939) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "status_id"
    t.text     "description"
    t.string   "url"
    t.integer  "contact_id"
    t.decimal  "hourly_rate", :precision => 10, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "cellphone"
    t.string   "phone_number"
    t.string   "address"
    t.string   "city"
    t.string   "neighbourhood"
    t.string   "state",         :limit => 2
    t.string   "postal_code",   :limit => 10
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "status_id"
    t.string   "area"
    t.string   "url"
    t.boolean  "completed",                                  :default => false
    t.decimal  "hourly_rate", :precision => 10, :scale => 2, :default => 0.0
    t.integer  "client_id"
    t.integer  "user_id"
    t.text     "description"
    t.text     "whiteboard"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
  end

  create_table "projects_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles_users", :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "model"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.text     "note"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.text     "descrition"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ticket_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ticket_comments", :force => true do |t|
    t.text     "body"
    t.integer  "version_id"
    t.integer  "ticket_id"
    t.decimal  "time",       :precision => 19, :scale => 4
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "ticket_comments", ["ticket_id"], :name => "index_ticket_comments_on_ticket_id"
  add_index "ticket_comments", ["version_id"], :name => "index_ticket_comments_on_version_id"

  create_table "ticket_priorities", :force => true do |t|
    t.string   "name"
    t.string   "weight"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ticket_statuses", :force => true do |t|
    t.string   "name"
    t.boolean  "active",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "ticket_statuses", ["active"], :name => "index_ticket_statuses_on_active"

  create_table "tickets", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "ticket_category_id"
    t.integer  "assignee_id"
    t.integer  "status_id"
    t.decimal  "estimated_time",     :precision => 19, :scale => 4, :default => 0.0
    t.decimal  "actual_time",        :precision => 19, :scale => 4, :default => 0.0
    t.boolean  "billable",                                          :default => true
    t.integer  "ticket_priority_id"
    t.integer  "project_id"
    t.decimal  "budget_progress",    :precision => 19, :scale => 4
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
  end

  add_index "tickets", ["assignee_id"], :name => "index_tickets_on_assignee_id"
  add_index "tickets", ["billable"], :name => "index_tickets_on_billable"
  add_index "tickets", ["end_date"], :name => "index_tickets_on_end_date"
  add_index "tickets", ["project_id"], :name => "index_tickets_on_project_id"
  add_index "tickets", ["start_date"], :name => "index_tickets_on_start_date"
  add_index "tickets", ["status_id"], :name => "index_tickets_on_status_id"
  add_index "tickets", ["ticket_category_id"], :name => "index_tickets_on_ticket_category_id"
  add_index "tickets", ["ticket_priority_id"], :name => "index_tickets_on_ticket_priority_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "address_id"
    t.integer  "contact_id"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_teams", :force => true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.text     "object"
    t.string   "object_changes"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

  create_table "works", :force => true do |t|
    t.integer  "project_id"
    t.integer  "task_id"
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.integer  "watcher_id"
    t.date      "historic_date"
    t.string    "historic_start"
    t.string    "historic_finish"
    t.decimal  "historic_duration",           :precision => 19, :scale => 0
    t.decimal  "additional_cost",             :precision => 19, :scale => 0
    t.text     "description"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

end
