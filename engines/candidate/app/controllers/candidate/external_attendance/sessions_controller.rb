module Candidate
  module ExternalAttendance
    class SessionsController < ApplicationController

      def new
        @session = Candidate::ExternalAttendance::Session.new
      end
      
      def create
        @session = Candidate::ExternalAttendance::Session.new(set_params)
        
        if @session.authenticate(session)
          redirect_to candidate.external_attendance_candidates_path
        else
          render action: :new
        end
      end

      private

      def set_params
        params.require(:external_attendance_session).permit(:cpf, :password)
      end
    end
  end
end