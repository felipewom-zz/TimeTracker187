class CreateUsersTeams < ActiveRecord::Migration
  def change
    create_table :users_teams, :id => false, :force => true  do |t|
      t.integer :user_id
      t.integer :team_id

      t.timestamps

      add_index "users_teams", ["user_id"], :name => "index_users_teams_on_user_id"
      add_index "users_teams", ["team_id"], :name => "index_users_teams_on_team_id"
    end
  end
end
