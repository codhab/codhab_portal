module Candidate
  module ExternalAttendance
    class Ticket < ActiveRecord::Base
      self.table_name = 'extranet.attendance_custom_tickets'

      has_many :ticket_requests
      
      def complete?
        action_one &&
        action_two &&
        action_three &&
        action_four &&
        action_five
      end
    end
  end
end