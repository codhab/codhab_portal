module Candidate
  module ExternalAttendance
    class TicketRequest < ActiveRecord::Base
      self.table_name = 'extranet.attendance_custom_ticket_requests'

    end
  end
end