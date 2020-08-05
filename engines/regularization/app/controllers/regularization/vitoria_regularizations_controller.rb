require_dependency 'regularization/application_controller'

module Regularization
  class VitoriaRegularizationsController < ApplicationController 

    def index
      session[:vitoria_regularization_id] = nil
      session[:unit_id] = nil
    end

    def new
      @vitoria_regularization = Regularization::VitoriaRegularization.new
    end
    
    def create
      @vitoria_regularization = Regularization::VitoriaRegularization.new(set_params)
      
      if @vitoria_regularization.save
        session[:vitoria_regularization_id] = @vitoria_regularization.id
        redirect_to regularization.edit_vitoria_regularization_path(@vitoria_regularization)
      else
        render action: :new
      end
    end
    
    def show
      @vitoria_regularization = Regularization::VitoriaRegularization.where(cpf: params[:cpf])
    end
    
    def edit
      @vitoria_regularization = Regularization::VitoriaRegularization.find(session[:vitoria_regularization_id])
    end
    
    def update
      @vitoria_regularization = Regularization::VitoriaRegularization.find(session[:vitoria_regularization_id])
      
      if @vitoria_regularization.candidato? && @vitoria_regularization.update(set_edit_params)
        render action: :edit
      else
        render action: :edit
      end
      
      
    end
    
    def update_situation
      @vitoria_regularization = Regularization::VitoriaRegularization.find(session[:vitoria_regularization_id])
      @vitoria_regularization.update(situation_id: 2) 

      render action: :edit
    end
    
    def get_iptu_code
    end
    
    def set_iptu
      @vitoria_regularization = Regularization::VitoriaRegularization.new(set_params_iptu)
      @vitoria_regularization.iptu_valid?(session)

      render action: :new
    end

    private

    def set_edit_params
      params.require(:vitoria_regularization)
        .permit(:name, :rg, :naturality, :unit_id,
                :income, :habitation_type_id, :spouse_cpf, 
                :spouse_rg, :spouse_name, :spouse_job, 
                :spouse_income, :phone, :email, :civil_state_id,
                :no_iptu_code, :born, :declaration_occupation, 
                :declaration_negative, :declaration_descriptive, :declaration_pacific, 
                :declaration_unit_area, :declaration_spouse_pacific, :declaration_informal_activity, 
                :declaration_informal_activity_value, :declaration_spouse_informal_activity, 
                :declaration_spouse_informal_activity_value, :terms_use,
                :complete_address, :spouse_born, :unit_characterist, :unit_characterist_occupation, 
                :unit_characterist_edification, :unit_characterist_room, :unit_characterist_dweller, 
                :unit_characterist_piped_water, :unit_characterist_electricity, :unit_characterist_sewer,
                :document_rg, 
                :phone_secondary,
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
      params.require(:vitoria_regularization)
        .permit(:iptu_code)
    end

    def set_params
      params.require(:vitoria_regularization)
        .permit(:name, :iptu_code, :cpf, :rg, :naturality, 
                :income, :habitation_type_id, :spouse_cpf, :unit_id, :declaration_occupation_quantity,
                :spouse_rg, :spouse_name, :spouse_job, :phone_secondary,
                :spouse_income, :phone, :email, :civil_state_id,
                :no_iptu_code, :born, :declaration_occupation, 
                :declaration_negative, :declaration_descriptive, :declaration_pacific, 
                :declaration_unit_area, :declaration_spouse_pacific, :declaration_informal_activity, 
                :declaration_informal_activity_value, :declaration_spouse_informal_activity, 
                :declaration_spouse_informal_activity_value, :terms_use,
                :complete_address, :spouse_born, :unit_characterist, :unit_characterist_occupation, 
                :unit_characterist_edification, :unit_characterist_room, :unit_characterist_dweller, 
                :unit_characterist_piped_water, :unit_characterist_electricity,
                :unit_characterist_sewer)
  
    end

  end
end