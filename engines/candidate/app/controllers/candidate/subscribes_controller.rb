require_dependency 'candidate/application_controller'

module Candidate
  class SubscribesController < ApplicationController
    
    def cities
      render json: Core::Address::City.where(state_id: params[:state_id]).order(name: :asc)
    end

    def index
      redirect_to action: :new
    end 

    def new
      @cadastre = Candidate::Subscribe.new
    end 
    
    def create
      @cadastre = Candidate::Subscribe.new(set_params)
      if @cadastre.save
        flash.now[:success] = 'Sua inscrição foi realizada com sucesso!'
      else
        flash.now[:danger] = 'Ops... verifique os dados informados em vermelho.'
        render action: :new
      end
    end 

    def show
    end 

    private

    def set_params
      params.require(:subscribe)
        .permit(
          :name, :cpf, :name, :gender_id, :born, :rg, :rg_org, :rg_state_id, :rg_emission_date, :born_state_id, :nacionality, :mother_name, :arrival_df, :civil_state_id, :income, :special_conditionfalse, :special_condition_type_idtrue, :cid, :nis, :celphone, :telephone, :email, :cep, :state_id, :city_id, :burgh, :address, :address_number, :address_complement, :work_cep, :work_state_id, :work_city_id, :work_address, :special_condition, :special_condition_type_id,
          subscribe_dependents_attributes: [:name, :nacionality, :_destroy, :cpf, :born, :born_state_id, :gender_id, :rg, 
          :rg_org, :rg_state_id, :rg_emission_date, :naturality, :civil_state_id, :income, :kinship_id, :special_condition, :special_condition_type_id, :cid, :nis, :id]
        )
    end
  end
end