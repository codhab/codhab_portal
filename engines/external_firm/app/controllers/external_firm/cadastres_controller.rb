require_dependency 'external_firm/application_controller'

module ExternalFirm
  class CadastresController < ApplicationController
    before_action :set_cadastre, only: [:destroy, :show, :edit, :update]

    def index
      @cadastres = current_external_company.cadastres
    end

    def new
      @cadastre = current_external_company.cadastres.new
    end

    def create
      @cadastre = current_external_company.cadastres.new(set_params)

      if @cadastre.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def show
    end

    def edit
    end

    def update
      if @cadastre.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
			if @cadastre.destroy
				 redirect_to action: :index
			end
		end

    private

    def set_params
      params.require(:cadastre).permit(:name, :cpf, :telephone, :celphone,
                                       :rg, :city_id, :address, :observation)
    end

    def set_cadastre
      @cadastre = current_external_company.cadastres.find(params[:id])
    end
  end
end
