class CreateMembersProjects < ActiveRecord::Migration
  def change
    create_table :members_projects, :id => false, :force => true do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps


    end
  end
end
