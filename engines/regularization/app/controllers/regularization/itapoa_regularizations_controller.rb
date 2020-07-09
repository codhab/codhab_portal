require_dependency 'regularization/application_controller'

module Regularization
  class ItapoaRegularizationsController < ApplicationController 

    def index
      session[:itapoa_regularization_id] = nil
      session[:unit_id] = nil
    end

    def new
      @itapoa_regularization = Regularization::ItapoaRegularization.new
    end
    
    def create
      @itapoa_regularization = Regularization::ItapoaRegularization.new(set_params)
      @itapoa_regularization.unit_id = session[:unit_id]
      
      if @itapoa_regularization.save
        session[:itapoa_regularization_id] = @itapoa_regularization.id
        redirect_to regularization.edit_itapoa_regularization_path(@itapoa_regularization)
      else
        render action: :new
      end
    end
    
    def show
      @itapoa_regularization = Regularization::ItapoaRegularization.where(cpf: params[:cpf])
    end
    
    def edit
      @itapoa_regularization = Regularization::ItapoaRegularization.find(session[:itapoa_regularization_id])
    end
    
    def update
      @itapoa_regularization = Regularization::ItapoaRegularization.find(session[:itapoa_regularization_id])
      
      if @itapoa_regularization.candidato? && @itapoa_regularization.update(set_edit_params)
        render action: :edit
      else
        render action: :edit
      end
      
      
    end
    
    def update_situation
      @itapoa_regularization = Regularization::ItapoaRegularization.find(session[:itapoa_regularization_id])
      @itapoa_regularization.update(situation_id: 2) 

      render action: :edit
    end
    
    def get_iptu_code
    end
    
    def set_iptu
      @itapoa_regularization = Regularization::ItapoaRegularization.new(set_params_iptu)
      @itapoa_regularization.iptu_valid?(session)

      render action: :new
    end

    private

    def set_edit_params
      params.require(:itapoa_regularization)
        .permit(:name, :rg, :naturality, 
                :income, :habitation_type_id, :spouse_cpf, 
                :spouse_rg, :spouse_name, :spouse_job, 
                :spouse_income, :phone, :email, :civil_state_id,
                :no_iptu_code, :born, :declaration_occupation_one, :declaration_occupation_two, 
                :declaration_negative, :declaration_descriptive, :declaration_pacific, 
                :declaration_unit_area, :declaration_spouse_pacific, :declaration_informal_activity, 
                :declaration_informal_activity_value, :declaration_spouse_informal_activity, 
                :declaration_spouse_informal_activity_value, :terms_use,
                :complete_address, :spouse_born, :unit_characterist, :unit_characterist_occupation, 
                :unit_characterist_edification, :unit_characterist_room, :unit_characterist_dweller, 
                :unit_characterist_piped_water, :unit_characterist_electricity,
                :document_rg, 
                :document_cpf, 
                :document_civil_state, 
                :document_income, 
                :document_spouse_income, 
                :document_spouse_rg, 
                :document_spouse_cpf, 
                :document_occupation_time, 
                :photo_unit_front, 
                :photo_unit_inside_one, 
                :photo_unit_inside_two, 
                :document_address, 
                :document_iptu )     
    end

    def set_params_iptu
      params.require(:itapoa_regularization)
        .permit(:iptu_code)
    end

    def set_params
      params.require(:itapoa_regularization)
        .permit(:name, :iptu_code, :cpf, :rg, :naturality, 
                :income, :habitation_type_id, :spouse_cpf, 
                :spouse_rg, :spouse_name, :spouse_job, 
                :spouse_income, :phone, :email, :civil_state_id,
                :no_iptu_code, :born, :declaration_occupation_one, :declaration_occupation_two, 
                :declaration_negative, :declaration_descriptive, :declaration_pacific, 
                :declaration_unit_area, :declaration_spouse_pacific, :declaration_informal_activity, 
                :declaration_informal_activity_value, :declaration_spouse_informal_activity, 
                :declaration_spouse_informal_activity_value, :terms_use,
                :complete_address, :spouse_born, :unit_characterist, :unit_characterist_occupation, 
                :unit_characterist_edification, :unit_characterist_room, :unit_characterist_dweller, 
                :unit_characterist_piped_water, :unit_characterist_electricity)
  
    end

  end
end