require_dependency "firm/application_controller"

module Firm
  class CadastreAddressController < ApplicationController

    before_action :set_unit


    def new
      @enterprise_status = Firm::EnterpriseCadastreSituation.new
      if params[:by_cpf].present?
        @candidate_firm = Firm::EnterpriseCadastre.joins(:cadastre).where("extranet.candidate_cadastres.cpf = ? AND extranet.candidate_enterprise_cadastres.inactive is null",params[:by_cpf]).last
        if @candidate_firm .present?
         @candidate = ::Candidate::Cadastre.find(@candidate_firm.cadastre_id)
        else
          flash[:warning] = "CPF não encontrado"
        end

      end
    end

   def book

      @enterprise_status = Firm::EnterpriseCadastreSituation.new(enterprise_status_params)
      @enterprise_status.observation = "Reserva de imóvel"
      @enterprise_status.enterprise_cadastre_status_id = 10
      @enterprise_status.firm_user_id = session[:firm_auth_id]
      @enterprise_status.save

      @cadastre_address = ::Candidate::CadastreAddress.new
      @cadastre_address.cadastre_id =  params[:enterprise_cadastre_situation][:cadastre_id]

      @cadastre_address.unit_id =   @unit.id
      @cadastre_address.save

      @unit.update(situation_unit_id: 6)

      redirect_to enterprise_cadastres_path


   end

   def sale

       @cadastre_address = Candidate::CadastreAddress.new
       @candidateAddress = Candidate::CadastreAddress.where(unit_id: params[:enterprise_unit_id]).last
   end



   def sell
       @cadastre_address = ::Candidate::CadastreAddress.where(unit_id: @unit_id).last
       @cadastre_address.update(dominial_chain:0, type_occurrence: 0 ,type_receipt: 0)
       ::Candidate::CadastreAddress.update_tables_sale(@cadastre_address.cadastre_id, @cadastre_address.unit_id, 7, status, 3,session[:firm_auth_id],params[:observation])


        redirect_to enterprise_units_path

   end

   def refund

      @cadastre_address = ::Candidate::CadastreAddress.where(unit_id: @unit_id).last
      @cadastre_address.destroy
      redirect_to enterprise_units_path
   end



    private



    def enterprise_status_params
      params.require(:enterprise_cadastre_situation).permit(:enterprise_cadastre_id,:observation, :status_cadastre_id,:file_path, :firm_user_id)
    end

    def address_params
      params.require(:registry_unit).permit(:cadastre_id, :unit_id, :enterprise_id)
    end

    def set_enterprise
      @enterprise = Firm::Enterprise.find(params[:id])

    end

    def set_cadastre_address

       @cadastre_address = Candidate::CadastreAddress.where(params[:id])
    end

    def set_unit
        @unit = ::Address::Unit.find(params[:enterprise_unit_id])
    end

  end
end
