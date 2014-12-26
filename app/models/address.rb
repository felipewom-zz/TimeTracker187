class Address < ActiveRecord::Base
  attr_accessible :Neighbourhood, :city, :complement, :postal_code, :state, :street, :type
end
