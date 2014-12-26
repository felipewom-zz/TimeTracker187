class TicketComment < ActiveRecord::Base
  attr_accessible :body, :ticket_id, :version_id
end
