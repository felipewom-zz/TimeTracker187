class Work < ActiveRecord::Base
  attr_accessible :additional_cost, :description, :duration, :finish, :project_id, :start, :task_id, :user_id
end
