class Client < ActiveRecord::Base
  belongs_to :contact
  belongs_to :status
  attr_accessible :contact_id, :description, :name, :status_id, :url, :hourly_rate

end
