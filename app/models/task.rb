class Task < ActiveRecord::Base
  attr_accessible :completed, :note, :title
end
