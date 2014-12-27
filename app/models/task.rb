class Task < ActiveRecord::Base
  belongs_to :user
  attr_accessible :note, :title, :user_id
end
