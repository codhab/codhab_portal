module Candidate
  module ExternalAttendance
    class SessionsController < ApplicationController

      def new
        @session = ::Candidate::ExternalAttendance::Session.new
      end
      
      def create
        @session = ::Candidate::ExternalAttendance::Session.new(set_params)
        
        if @session.authenticate(session)
          redirect_to candidate.external_attendance_candidates_path
        else
          render action: :new
        end
      end

      def destroy
        session[:external_attendance_user_id] = nil

        redirect_to candidate.new_external_attendance_session_path
      end

      private

      def set_params
        params.require(:external_attendance_session).permit(:cpf, :password)
      end
    end
  end
end