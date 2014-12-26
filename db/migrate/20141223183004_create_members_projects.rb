class CreateMembersProjects < ActiveRecord::Migration
  def change
    create_table :members_projects, :id => false, :force => true do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps

      add_index "members_projects", ["user_id"], :name => "index_members_projects_on_user_id"
      add_index "members_projects", ["project_id"], :name => "index_members_projects_on_project_id"
    end
  end
end
