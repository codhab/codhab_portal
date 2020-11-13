require_dependency "firm/application_controller"

module Firm
  class EnterpriseCadastreSituationsController < ApplicationController

    before_action :validate_session!, except: [:index]
    before_action :set_enterprises, except: [:index]
    before_action :set_enterprise_cadastre, except: [:index]

    has_scope :type_action
    # GET /inheritors
    def index
      respond_to do |format|
        format.json {
          @enterprise_situation_statuses = apply_scopes(::Firm::EnterpriseCadastreSituation).all
        }
      end
    end

    def new
      @enterprise_situation = @enterprise_cadastre.enterprise_cadastre_situations.new
    end

    def create
      @enterprise_situation = ::Firm::EnterpriseCadastreSituation.where(enterprise_cadastre_id: @enterprise_cadastre.id).new(enterprise_status_params)
      @enterprise_situation.enterprise_cadastre_status_id = params[:enterprise_cadastre_status_id]
      @enterprise_situation.save
      if @enterprise_situation.type_action == 'devolução'
        @enterprise_cadastre.update(inactive: true, inactive_date: Date.today)
      end
      @enterprise_cadastres = Core::Candidate::EnterpriseCadastre.where(enterprise_id: @enterprises).paginate(:page => params[:page], :per_page => 20)

      redirect_to enterprise_cadastres_path if @enterprise_situation.file_path.present?
    end


    private


    def validate_session!
      if session[:firm_auth_id].present? && session[:firm_expiration_id].present? && session[:firm_expiration_id] > Time.now
       @firm = Core::Project::UserCompany.find(session[:firm_auth_id])
      else
       redirect_to firm.new_authorization_path
      end
    end

    def enterprise_status_params
      params.require(:candidate_enterprise_cadastre_situation).permit(:enterprise_cadastre_id,:observation,
                                                            :enterprise_cadastre_status_id,:file_path,
                                                            :type_action, :enterprise_situation_action_id,
                                                            :success, :enterprise_cadastre_id)
    end

    def set_enterprise_cadastre
      params[:enterprise_cadastre_id] = params[:enterprise_cadastre_id].present? ? params[:enterprise_cadastre_id] : params[:candidate_enterprise_cadastre_situation][:enterprise_cadastre_id]
      @enterprise_cadastre = Core::Candidate::EnterpriseCadastre.find(params[:enterprise_cadastre_id])
    end

    def set_enterprises
      @enterprises = Core::Project::Enterprise.where(company_id: @firm.company_id)
    end
  end
end
