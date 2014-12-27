class CreateUsersTeams < ActiveRecord::Migration
  def change
    create_table :users_teams, :id => false, :force => true  do |t|
      t.integer :user_id
      t.integer :team_id

      t.timestamps


    end
  end
end
