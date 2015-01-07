class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_and_belongs_to_many :roles
  belongs_to :contact
  accepts_nested_attributes_for :contact
  has_many :works
  has_many :projects, :through => :works

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  attr_accessible :username, :unconfirmed_email, :address_id, :contact_id

  after_create :default_role

  def to_s
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def is?(role)
    self.roles.any? do |r|
      r[:name] == role.to_s
    end
  end

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  private
  def default_role
    if Role.all.empty?
      Role.new('user', 'Usuário')
      self.roles << Role.where(:name => 'user').first
    end
  end
end
