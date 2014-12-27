class UsersTeam < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  attr_accessible :team_id, :user_id
end
