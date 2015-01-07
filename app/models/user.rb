class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :authentication_keys => [:login]
  has_and_belongs_to_many :roles
  belongs_to :contact
  accepts_nested_attributes_for :contact
  has_many :works
  has_many :projects, :through => :works

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  attr_accessible :username, :unconfirmed_email, :address_id, :contact_id
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessible :login

  validates :username, :uniqueness => {:case_sensitive => false}
  validates :email, :uniqueness =>  {:case_sensitive => false}

  after_create :default_role

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

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

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {:value => login.downcase}]).first
    else
      where(conditions).first
    end
  end

  private
  def default_role
    if Role.all.empty?
      Role.new('user', 'Usuário')
      self.roles << Role.where(:name => 'user').first
    end
  end
end
