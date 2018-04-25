require_dependency 'social_work_cadastre/application_controller'

module SocialWorkCadastre
  class ResponsiblesController < ApplicationController

    before_action :set_cadastre
		before_action :set_responsibles, only: [:index, :create, :destroy, :update]
    before_action :set_responsible, only: [:edit, :destroy, :update]

    def index
      @responsibles = @cadastre.responsibles.where(cadastre_id: session[:current_external_company_id]).all
    end

    def new
      @responsible = @cadastre.responsibles.new
    end

    def create
      @responsible = @cadastre.responsibles.new(set_params)
      resp = @cadastre.responsibles
      resp.each do |r|
        r.responsible = false
        r.save
      end
      @responsible.destroy_step(@cadastre)
      @responsible.update(responsible: true)
      redirect_to social_work_cadastre.show_path
    end

    def update
      if @responsible.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @responsible.destroy
        redirect_to action: :index
      end
    end

    private

    def set_params
      params.require(:social_work_cadastre_responsible).permit(:members_id, :cadastre_id)
    end

    def set_cadastre
      @cadastre = Core::SocialWorkCadastre::Cadastre.find(session[:current_external_company_id])
    end

    def set_responsible
      @responsible = Core::SocialWorkCadastre::Responsible.find(params[:id])
    end

    def set_responsibles
      @responsibles = @cadastre.responsibles.all
    end
  end
end
