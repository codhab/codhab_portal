require_dependency 'regularization/application_controller'

module Regularization
  class ItapoaRegularizationsController < ApplicationController 

    def index
    end
    
    def new
      @itapoa_regularization = Regularization::ItapoaRegularization.new
    end
    
    def create
      @itapoa_regularization = Regularization::ItapoaRegularization.new(set_params)

      if @itapoa_regularization.save
        render 'success'
      else
        render action: :new
      end
    end

    def show
      @itapoa_regularization = Regularization::ItapoaRegularization.where(cpf: params[:cpf])
    end

    def get_iptu_code
    end

    private

    def set_params
      params.require(:itapoa_regularization)
        .permit(:name, :iptu_code, :cpf, :rg, :naturality, 
                :income, :habitation_type_id, :spouse_cpf, 
                :spouse_rg, :spouse_name, :spouse_job, 
                :spouse_income, :phone, :email, :civil_state_id,
                :no_iptu_code, :born, :declaration_occupation_one, :declaration_occupation_two, 
                :declaration_negative, :declaration_descriptive, :declaration_pacific, 
                :declaration_unit_area, :declaration_spouse_pacific, :declaration_informal_activity, :declaration_informal_activity_value, :declaration_spouse_informal_activity, :declaration_spouse_informal_activity_value, :terms_use)
  
    end

  end
end