require_dependency 'regularization/application_controller'

module Regularization
  class MestreDarmasRegularizationsController < ApplicationController
    
    def index
    end

    def show
    end

    def new
      @regularization = Regularization::MestreDarmasRegularization.new
    end
    
    def create
      @regularization = Regularization::MestreDarmasRegularization.new(set_params)

      if @regularization.save 
        redirect_to action: :show
      else
        render action: :new
      end
    end
    

    private

    def set_params
      params.require(:mestre_darmas_regularization)
        .permit(:name, :address, :cpf, :rg, :rg_emission_date, :rg_org, :civil_state_id, :income, :nationality, :contact_phone, :contact_mobile, :contact_email, :spouse_name, :spouse_cpf, :spouse_rg, :spouse_rg_emission_date, :spouse_rg_org, :declaration_descriptive, :declaration_pacific, :declaration_spouse_pacific, :declaration_stable_union, :declaration_informal_activity, :declaration_informal_activity_value, :declaration_spouse_informal_activity, :declaration_spouse_informal_activity_value, :terms_use)
    end

  end
end