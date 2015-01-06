class Contact < ActiveRecord::Base
  has_many :users
  attr_accessible :address, :cellphone, :email, :name, :phone_number, :city, :state, :postal_code, :neighbourhood

  def to_s
    "#{address}, #{neighbourhood.capitalize}, #{city}/#{state}"
  end
end
