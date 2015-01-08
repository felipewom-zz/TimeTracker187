class Work < ActiveRecord::Base
  belongs_to :project
  belongs_to :task
  belongs_to :user
  attr_accessible :additional_cost, :description, :duration, :finish, :project_id, :start, :task_id, :user_id, :historic_date

  validates :duration, :numericality => {:greater_than => 0, :less_than => 24}
end
