class Project < ActiveRecord::Base
  attr_accessible :area, :client_id, :description, :end_date, :name, :rate, :start_date, :status, :url, :whiteboard
end
