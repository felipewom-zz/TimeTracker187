class Version < ActiveRecord::Base
  attr_accessible :event, :item_id, :item_type, :object, :object_changes
end
