require_dependency 'firm/application_controller'

module Firm
  class RefundsController < ApplicationController
    before_action :set_unit

    def new

      @refund = Firm::Refund.new
    end

    def create
      current_user_company = Firm::UserCompany.find(session[:firm_auth_id])

      @refund = Firm::Refund.new(set_params)

      if @refund.valid?
        service  = Firm::RefundService.new(@refund.cadastre, @enterprise_unit, current_user_company)
        service.refund!(@refund.observation, @refund.file_path)
        @enterprise_cadastres = Firm::EnterpriseCadastre.where(enterprise_id: @enterprise_unit.enterprise_typology.enterprise_id).paginate(:page => params[:page], :per_page => 20)
        flash[:success] = "Reserva de imóvel liberada com sucesso."
        redirect_to enterprise_cadastres_path 
      else
        render :new
      end

    end

    private

    def set_unit
        params[:unit_id] = params[:unit_id].present? ? params[:unit_id] : params[:refund][:unit_id]
        @enterprise_unit = ::Address::Unit.find(params[:unit_id])
    end

    def set_params
      params.require(:refund).permit(:cpf, :observation, :file_path, :unit_id)
    end
  end
end
