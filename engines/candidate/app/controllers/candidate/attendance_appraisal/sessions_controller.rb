require_dependency 'candidate/application_controller'

module Candidate
  module AttendanceAppraisal
    class SessionsController < ApplicationController

      def index
        redirect_to action: :new
      end

      def new
       @session = ::Candidate::AttendanceAppraisal::Session.new
      end
      
      def create
        @session = ::Candidate::AttendanceAppraisal::Session.new(set_params)
        
        if @session.authenticate(session)
          redirect_to candidate.attendance_appraisal_appraisals_path
        else
          render action: :new
        end
      end

      def destroy
        session[:external_medical_attendance_user_id] = nil

        redirect_to candidate.new_attendance_appraisal_session_path
      end

      private

      def set_params
        params.require(:attendance_appraisal_session).permit(:username, :password)
      end
    end
  end
end