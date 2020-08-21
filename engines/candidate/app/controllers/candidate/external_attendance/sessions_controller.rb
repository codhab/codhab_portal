module Candidate
  module ExternalAttendance
    class SessionsController < ApplicationController

      def new
        @session = Candidate::ExternalAttendance::Session.new
      end
      
      def create
        @session = Candidate::ExternalAttendance::Session.new(set_params)
        
        if @session.authenticate(session)
          
        else
          render action: :new
        end
      end

      private

      def set_params
        params.require(:session).permit(:cpf, :password)
      end
    end
  end
end