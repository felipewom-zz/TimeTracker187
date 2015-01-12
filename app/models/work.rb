class Work < ActiveRecord::Base
  belongs_to :project
  belongs_to :task
  belongs_to :user
  attr_accessible :additional_cost, :description, :duration_to_show, :historic_finish, :project_id, :historic_start, :task_id, :user_id, :historic_date, :historic_duration

  validates :historic_duration, :numericality => {:greater_than => 0, :less_than => 86400000}
end
