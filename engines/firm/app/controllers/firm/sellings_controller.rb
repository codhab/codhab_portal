require_dependency 'firm/application_controller'

module Firm
  class SellingsController < ApplicationController
    before_action :set_unit

    def new
      @selling = Firm::Selling.new
    end

    def create
      current_user_company = Firm::UserCompany.find(session[:firm_auth_id])
      @selling = Firm::Selling.new(set_params)

      if @selling.valid?
        service  = Firm::SellingService.new(@selling.cadastre, @enterprise_unit, current_user_company)
        service.sell!(@selling.observation, @selling.file_path)

        @enterprise_cadastres = Firm::EnterpriseCadastre.where(enterprise_id: @enterprise_unit.enterprise_typology.enterprise_id).paginate(:page => params[:page], :per_page => 20)
        flash[:success] = "Venda do imóvel efetuada com sucesso."
        redirect_to enterprise_cadastres_path 

      else
        render :new
      end



    end

    private

    def set_unit
        params[:unit_id] = params[:unit_id].present? ? params[:unit_id] : params[:selling][:unit_id]
        @enterprise_unit = ::Address::Unit.find(params[:unit_id])
    end

    def set_params
      params.require(:selling).permit(:cpf, :observation, :file_path, :unit_id)
    end
  end
end
