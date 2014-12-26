class Contact < ActiveRecord::Base
  attr_accessible :address_id, :cellphone, :client_id, :email, :name, :phone_number
end
