require_dependency "firm/application_controller"

module Firm
  class EnterpriseUnitsController < ApplicationController
      before_action :validate_session!
      before_action :set_enterprises
      before_action :set_enterprise_unit, only: [:show]
      before_action :set_tab

      has_scope :address
      has_scope :status
      has_scope :by_cpf
      has_scope :by_typology
      has_scope :by_enterprise

    def index

      arr =[]

      @enterprises.each do |ent|
        arr += ent.enterprise_typologies.ids if ent.enterprise_typologies.present?
      end
       @enterprise_units = ::Address::Unit.where(enterprise_typology_id: arr)
       @enterprise_units_excel = apply_scopes(@enterprise_units)
       @enterprise_units =  @enterprise_units_excel.paginate(:page => params[:page], :per_page => 20)
    end

    def new
        @enterprise_status = Firm::EnterpriseCadastreSituation.new
    end

    def show

    end

    def create

        @enterprise_status = Firm::EnterpriseCadastreSituation.new(enterprise_status_params)

        @enterprise_status.save

        redirect_to enterprise_cadastres_path
    end

    private

     def validate_session!
        if session[:firm_auth_id].present? && session[:firm_expiration_id].present? && session[:firm_expiration_id] > Time.now
          @firm = Firm::UserCompany.find(session[:firm_auth_id])
        else
          redirect_to firm.new_authorization_path
        end
      end

    def enterprise_status_params
      params.require(:enterprise_status).permit(:cadastre_id,:enterprise_cadastre_id,:observation, :status_cadastre_id,:archive_file)
    end

    def set_enterprise_unit
      @enterprise_unit = ::Address::Unit.find(params[:id])
    end

    def set_enterprises
      if @firm.id == 92
        @enterprises = Firm::Enterprise.where(id: 9, status: true)
      else
        @enterprises = Firm::Enterprise.where(company_id: @firm.company_id, status: true)
      end
    end

    def set_tab
      @tab = 'enderecos'
    end
  end
end
