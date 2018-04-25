require_dependency 'candidate/application_controller'

module Candidate
  module RestrictArea
    class ManifestationsController < ApplicationController
      before_action :set_cadastre

      def index

      end

      def new
        @enterprise_id = ::Firm::Enterprise.where(manifestation_enabled: true)
        @enterprise_id = @enterprise_id.find(params[:enterprise_id]).id rescue nil

        @indication = @cadastre.enterprise_cadastres.new({
          cadastre_id: @cadastre.id,
          enterprise_id: @enterprise_id,
          inactive: false,
          indication_situation_id: 2,
          indication_type_id: 2,
          manifestation_date: Date.current
        }) 

        @indication.save!
      end

      def destroy
        @enterprise_id = ::Firm::Enterprise.where(manifestation_enabled: true)
        @enterprise_id = @enterprise_id.find(params[:enterprise_id]).id rescue nil

        @indication = @cadastre.enterprise_cadastres.where(enterprise_id: @enterprise_id, 
                                                           inactive: false,
                                                           indication_situation_id: 2).last
        @indication.update(indication_situation_id: 3,
                           inactive_date: Date.current,
                           inactive: true) 
      end

      private

      def set_cadastre
        @cadastre = ::Candidate::Cadastre.find(session[:cadastre_id]) rescue nil
        
        #if @cadastre.current_situation_id != 4
        redirect_to restrict_area_root_path 
        #end

        @enterprises = ::Firm::Enterprise.where(manifestation_enabled: true)
      
      end

    end
  end
end