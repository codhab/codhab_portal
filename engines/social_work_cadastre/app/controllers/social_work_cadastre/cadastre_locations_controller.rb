require_dependency 'social_work_cadastre/application_controller'

module SocialWorkCadastre
  class CadastreLocationsController < ApplicationController

      before_action :set_locales, only: [:edit, :destroy, :update]

    def locales
      @locales = Core::SocialWorkCadastre::CadastreLocation.new
      @locales.cadastre_id = params[:id]
      @locales.location_id = params[:local]
      @locales.save
      redirect_to  cadastre_path(id: params[:id], q: 'l')
    end

    def destroy
      @locales.destroy
    end

    private

    def set_locales
      @locales = Core::SocialWorkCadastre::CadastreLocation.find(params[:id])
    end
  end
end
