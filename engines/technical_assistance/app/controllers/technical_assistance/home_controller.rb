require_dependency "technical_assistance/application_controller"
module TechnicalAssistance      
  class HomeController < ApplicationController
  
    def index
    end

    def candidates
     @station = Core::TechnicalAssistance::Station.find(params[:station_id])
     @candidates = Core::SocialWork::SocialCandidate.where(station_id: params[:station_id])
    end

    def melhorias
    end
  end
end