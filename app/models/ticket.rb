class Ticket < ActiveRecord::Base
  attr_accessible :actual_time, :assignee_id, :billable, :budget_progress, :description, :end_date, :estimated_time, :name, :project_id, :start_date, :status_id, :ticket_category_id, :ticket_priority_id
end
