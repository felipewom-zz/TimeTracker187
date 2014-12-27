class Team < ActiveRecord::Base
  attr_accessible :descrition, :name

  def to_s
    self.name
  end
end
