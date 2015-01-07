class Task < ActiveRecord::Base
  belongs_to :project
  attr_accessible :note, :title, :project_id
end
