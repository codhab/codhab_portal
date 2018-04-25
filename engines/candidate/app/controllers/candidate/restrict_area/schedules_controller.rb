require_dependency 'candidate/application_controller'

module Candidate
  module RestrictArea
    class SchedulesController < ApplicationController
      
      before_action :set_cadastre

      def index
      end

      def destroy
        @schedule = @cadastre.agenda_schedules.find(params[:id])
        @schedule.destroy 
        
        flash[:success] =  t :success

        redirect_to action: :index
      end

      private

      def set_cadastre
        @cadastre = ::Candidate::Cadastre.find(session[:cadastre_id]) rescue nil
      end

    end
  end
end