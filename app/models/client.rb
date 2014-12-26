class Client < ActiveRecord::Base
  attr_accessible :address_id, :description, :name, :status, :url
end
