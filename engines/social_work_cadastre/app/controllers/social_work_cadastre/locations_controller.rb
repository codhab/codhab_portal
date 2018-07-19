require_dependency 'social_work_cadastre/application_controller'

module SocialWorkCadastre
  class LocationsController < ApplicationController

    before_action :set_location, only: [:edit, :destroy, :update]

    def index
      @locations = Core::SocialWorkCadastre::Location.all
    end

    def new
      @location = Core::SocialWorkCadastre::Location.new
    end

    def show_location
      @cadastre = Core::SocialWorkCadastre::Cadastre.find(session[:current_external_company_id])
      @locales = Core::SocialWorkCadastre::CadastreLocation.where(cadastre_id: session[:current_external_company_id])
      render layout: 'document'
    end

    def create
      @location = Core::SocialWorkCadastre::Location.new(set_params)

      if @location.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def update
      if @location.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @location.destroy
        redirect_to action: :index
      end
    end

    def result
      @locations = Core::SocialWorkCadastre::Location.all
    end

    private

    def set_params
      params.require(:location).permit(:city_id, :name, :status)
    end

    def set_location
      @location = Core::SocialWorkCadastre::Location.find(params[:id])
    end
  end
end
