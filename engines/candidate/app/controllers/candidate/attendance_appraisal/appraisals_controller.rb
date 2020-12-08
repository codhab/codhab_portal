require_dependency 'candidate/application_controller'

module Candidate
  module AttendanceAppraisal
    class AppraisalsController < ApplicationController
      before_action :authenticate!

      helper_method :current_medical
      
      def index
        @apprailsas = ::Candidate::AttendanceAppraisal::Appraisal.all.order(id: :asc).paginate(page: params[:page], per_page: 50)
      end
      
      def check
        @apprailsal = ::Candidate::AttendanceAppraisal::Appraisal.find(params[:appraisal_id])
        @apprailsal.update(medical_validate: !@apprailsal.medical_validate)
        @apprailsas = ::Candidate::AttendanceAppraisal::Appraisal.all.order(id: :asc).paginate(page: params[:page], per_page: 50)
      end
      private
      
      def current_medical
        ::Candidate::ExternalAttendance::User.find_by(id: session[:external_medical_attendance_user_id])
      end

      def authenticate!
        if current_medical.nil?
          redirect_to candidate.new_attendance_appraisal_session_path if controller_name != 'attendance_appraisal_sessions'
        end
      end

    end
  end
end