require_dependency 'social_work_cadastre/application_controller'

module SocialWorkCadastre
  class CadastreTitularsController < ApplicationController

    before_action :set_cadastre
		before_action :set_cadastre_titulars, only: [:index, :create, :destroy, :update]
    before_action :set_cadastre_titular, only: [:edit, :destroy, :update]

    def index
      @cadastre_titulars = @cadastre.cadastre_titulars.all
    end

    def new
      @cadastre_titular = @cadastre.cadastre_titulars.new
    end

    def edit
    end

    def create
      @cadastre_titular = @cadastre.cadastre_titulars.new(set_params)
        @cadastre_titular.save
      @cadastre_titular.destroy_step(@cadastre)
    end

    def update
      @cadastre_titular.update(set_params)
      @cadastre_titular.destroy_step(@cadastre)
    end

    def destroy
      if @cadastre_titular.destroy
        @cadastre_titular.destroy_step(@cadastre)
        redirect_to social_work_cadastre.show_path
      end
    end

    private

    def set_params
      params.require(:social_work_cadastre_cadastre_titular).permit(:crea_cau, :name, :formation, :rg, :cpf,
                                               :cadastre_id)
    end

    def set_cadastre
      @cadastre = Core::SocialWorkCadastre::Cadastre.find(params[:cadastre_id])
    end

    def set_cadastre_titular
      @cadastre_titular = Core::SocialWorkCadastre::CadastreTitular.find(params[:id])
    end

    def set_cadastre_titulars
      @cadastre_titulars = @cadastre.cadastre_titulars.all
    end
  end
end
