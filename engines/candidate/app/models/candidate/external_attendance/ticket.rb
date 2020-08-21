module Candidate
  module ExternalAttendance
    class Ticket < ActiveRecord::Base
      self.table_name = 'extranet.attendance_custom_tickets'

    end
  end
end