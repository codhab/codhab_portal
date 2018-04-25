require_dependency 'candidate/application_controller'

module Candidate
  class AttendancesController < ApplicationController
    before_action :set_attendance
 
    private

    def set_attendance
      
      plain =  "#{params[:id]}"           
      key   =  "QRCODEATENDIMENTO"                   
      
      cipher = plain.encrypt(key)      
      @id     = cipher.decrypt(key)              

      @attendance = Candidate::Attendance.find(@id.to_i) rescue nil
    end
  end
end