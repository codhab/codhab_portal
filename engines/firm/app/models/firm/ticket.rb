module Firm
  class Ticket < ActiveRecord::Base
    self.table_name = 'extranet.attendance_custom_tickets'
  end
end