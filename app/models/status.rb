class Status < ActiveRecord::Base
  has_many :clients
  has_many :projects
  attr_accessible :description, :model, :name

  before_create :downcase_model

  private
  def downcase_model
    self.model.downcase!
  end
end