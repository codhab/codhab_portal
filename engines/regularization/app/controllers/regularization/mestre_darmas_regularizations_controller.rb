require_dependency 'regularization/application_controller'

module Regularization
  class MestreDarmasRegularizationsController < ApplicationController
    before_action :allow_iframe
    layout 'application'
    
    def index
    end

    def show
      @regularization = Regularization::MestreDarmasRegularization.find(session[:mestre_darmas_id])
    end

    def new
      @regularization = Regularization::MestreDarmasRegularization.new
      
      session[:mestre_darmas_id] = nil
    end
    
    def create
      @regularization = Regularization::MestreDarmasRegularization.new(set_params)
      
      if @regularization.save
        session[:mestre_darmas_id] = @regularization.id
        redirect_to mestre_darmas_regularization_path(session[:mestre_darmas_id])
      else
        render action: :new
      end
    end
    

    private

    def set_params
      params.require(:mestre_darmas_regularization)
        .permit(:name, :address, :cpf, :rg, :rg_emission_date, :rg_org, :civil_state_id, :income, :nationality, :contact_phone, :contact_mobile, :contact_email, :spouse_name, :spouse_cpf, :spouse_rg, :spouse_rg_emission_date, :spouse_rg_org, :declaration_descriptive, :declaration_pacific, :declaration_spouse_pacific, :declaration_stable_union, :declaration_informal_activity, :declaration_informal_activity_value, :declaration_spouse_informal_activity, :declaration_spouse_informal_activity_value, :terms_use, :income_document, :cpf_document, :rg_document, :civil_state_document, :document_address, :document_iptu, :document_onus, :spouse_rg_document, :spouse_cpf_document)
    end
    
    def allow_iframe
      response.headers.delete('X-Frame-Options')
    end

  end
end
