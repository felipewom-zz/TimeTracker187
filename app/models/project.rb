class Project < ActiveRecord::Base
  has_many :tasks
  has_many :works
  has_and_belongs_to_many :owner_id, :class_name => 'User'
  belongs_to :client
  attr_accessible :area, :client_id, :description, :end_date, :name, :hourly_rate, :start_date, :status, :url, :whiteboard
end
