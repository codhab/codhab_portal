require_dependency 'firm/application_controller'

module Firm
  class EnterprisePreEnablesController < ApplicationController 
    before_action :set_tab
    before_action :validate_session!

    has_scope :by_cpf
    has_scope :by_manifestation
    has_scope :by_indication
    has_scope :by_occurrence
    has_scope :by_ticket_situation_id

    def index
      session[:filter_params] = params
      
      
      respond_to do |format|
        format.html {
          @pre_enables = apply_scopes(Firm::EnterprisePreEnable).paginate(:page => params[:page], :per_page => 20)
        }
        format.xlsx {
          @pre_enables = apply_scopes(Firm::EnterprisePreEnable).all
        }
      end
    end

    def manifestation
      @pre_enable = Firm::EnterprisePreEnable.find_by(cpf: params[:enterprise_pre_enable_id])
      @pre_enable.set_manifestation!
      params = session[:filter_params]
      redirect_to enterprise_pre_enables_path(params)
    end

    def occurrence
      @candidate = ::Candidate::ExternalAttendance::Candidate.find_by(cpf: params[:enterprise_pre_enable_id])
    end
    
    def ticket_request
      @candidate = ::Candidate::ExternalAttendance::Candidate.find_by(cpf: params[:enterprise_pre_enable_id])
    end


    private

    def set_tab
      @tab = 'pre_habilitados'
    end

    def validate_session!
      if session[:firm_auth_id].present? && session[:firm_expiration_id].present? && session[:firm_expiration_id] > Time.now
        @firm = Firm::UserCompany.find(session[:firm_auth_id])
      else
        redirect_to firm.new_authorization_path
      end
    end
  end
end