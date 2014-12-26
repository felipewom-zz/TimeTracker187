class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_and_belongs_to_many :roles
  after_create :default_role

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  attr_accessible :username, :unconfirmed_email, :phone

  def to_s
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def is?(role)
    self.roles.any? do |r|
      r[:name] == role.to_s
    end
  end

  private
  def default_role
    self.roles << Role.where(:name => 'user').first
  end
end
