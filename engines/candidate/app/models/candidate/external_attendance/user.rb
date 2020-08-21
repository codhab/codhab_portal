module Candidate
  module ExternalAttendance
    class User < ActiveRecord::Base
      self.table_name = 'extranet.attendance_external_users'
      
    end
  end
end