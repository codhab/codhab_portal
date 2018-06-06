require_dependency "technical_assistance/application_controller"
module TechnicalAssistance
  class HomeController < ApplicationController

    def index
    end

    def candidates
     @station = Core::TechnicalAssistance::Station.find(params[:station_id])
     @candidates = Core::SocialWork::SocialCandidate.where(station_id: params[:station_id]).where("process_number <> '' ")
    end

    def show_nascente
      @candidates = Core::SocialWork::SocialCandidate.where("station_id in(2,3) and process_number <> '' ")
    end

    def melhorias
    end

    def stations
      @station = Core::TechnicalAssistance::Station.find(params[:station_id])
      @member_1 = Core::TechnicalAssistance::Member.where(station_id: params[:station_id], category_id: 2)
      @member_resp_1 = @member_1.where(type_member_id: 2)
      @member_esta_1 = @member_1.where(type_member_id: 3)
      @member_volu_1 = @member_1.where(type_member_id: 4)
      @member_coor_1 = @member_1.where(type_member_id: 5)
      @member_2 = Core::TechnicalAssistance::Member.where(station_id: params[:station_id], category_id: 3)
      @member_resp_2 = @member_2.where(type_member_id: 2)
      @member_esta_2 = @member_2.where(type_member_id: 3)
      @member_volu_2 = @member_2.where(type_member_id: 4)
      @member_coor_2 = @member_2.where(type_member_id: 5)
      @member_3 = Core::TechnicalAssistance::Member.where(station_id: params[:station_id], category_id: 4)
    end
  end
end
