require_dependency "firm/application_controller"

module Firm
  class EnterpriseCadastresController < ApplicationController
     before_action :validate_session!
     before_action :set_enterprises

     before_action :set_cadastre, only: [:enable,  :index, :show]
     before_action :set_tab

     has_scope :by_cpf
     has_scope :by_name
     has_scope :by_situation
     has_scope :by_enterprise
     has_scope :by_new
     has_scope :by_list
     has_scope :by_date
     has_scope :by_inactive
     has_scope :by_inactive_date

    def index
      @enterprise_cadastres = Firm::EnterpriseCadastre.where.not(indication_type_id: 999)
                                                      .where(enterprise_id: @enterprises)
                                                      .includes([:cadastre, :enterprise_cadastre_situations]).all

      @enterprise_excell = apply_scopes(@enterprise_cadastres)
      @enterprise_cadastres = @enterprise_excell.paginate(:page => params[:page], :per_page => 20)
      respond_to do |format|
       format.html
       format.xlsx  { response.headers['Content-Disposition'] = "attachment; filename=candidatos#{Date.today.to_date}.xlsx" }
      end
    end

    def new
        @enterprise_cadastre = Firm::EnterpriseCadastreSituation.new
    end

   def enable
     @id = params[:enterprise_cadastre_id]
     @status_id = 10
      @enterprise_statuses = Firm::EnterpriseCadastreSituation.new
      @enterprise_statuses.cadastre_id = params[:cadastre_id]
      @enterprise_statuses.enterprise_cadastre_id = params[:enterprise_cadastre_id]
      @enterprise_statuses.status_cadastre_id = 10
      @enterprise_statuses.save

    end


    def show
      @enterprise_cadastre_situation = Firm::EnterpriseCadastreSituation.where(enterprise_cadastre_id: params[:id])
      @enterprise_cadastre = Firm::EnterpriseCadastre.where.not(indication_type_id: 999).find(params[:id])
    end

    private



     def validate_session!
       if session[:firm_auth_id].present? && session[:firm_expiration_id].present? && session[:firm_expiration_id] > Time.now
         @firm = Firm::UserCompany.find(session[:firm_auth_id])
       else
         redirect_to firm.new_authorization_path
       end
     end

     def set_cadastre
      @cadastre = ::Candidate::Cadastre.find(params[:cadastre_id]) rescue nil
     end


    def set_enterprise
      @enterprise = Project::Enterprise.find(params[:id])
    end

    def set_enterprises
      if @firm.id == 92
        @enterprises = 9
      else
        @enterprises = Firm::Enterprise.where(company_id: @firm.company_id)
      end
    end

    def set_tab
      @tab = 'candidatos'
    end
  end
end
