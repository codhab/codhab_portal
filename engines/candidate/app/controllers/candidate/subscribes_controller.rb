require_dependency 'candidate/application_controller'

module Candidate
  class SubscribesController < ApplicationController
    before_action :authenticate_subscriber!, only: [:edit, :update, :new_session, :create_session]

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

    def edit 
      @cadastre = Candidate::Subscribe.find(current_subscribe)
    end
    
    def update
      @cadastre = Candidate::Subscribe.find(current_subscribe)

      if @cadastre.update(set_params_update)
        flash.now[:success] = 'Sua inscrição foi realizada com sucesso!'
      else
        flash.now[:danger] = 'Ops... verifique os dados informados em vermelho.'
        render action: :edit
      end
    end 

    def new_session
      session[:candidate_subscribe_id] = nil
      @session = Candidate::SubscribeSession.new
    end
    
    def create_session
      @session = Candidate::SubscribeSession.new(set_session_params)

      if @session.valid?
        session[:candidate_subscribe_id] = @session.subscribe_id
        redirect_to edit_subscribe_path(@session.subscribe_id)
      else
        render action: :new_session
      end
    end


    private

    def set_params
      params.require(:subscribe)
        .permit(
          :name, :cpf, :name, :gender_id, :born, :rg, :rg_org, :rg_state_id, :rg_emission_date, :born_state_id, :nacionality, :mother_name, :arrival_df, :civil_state_id, :income, :special_conditionfalse, :special_condition_type_idtrue, :cid, :nis, :celphone, :telephone, :email, :cep, :state_id, :city_id, :burgh, :address, :address_number, :address_complement, :work_cep, :work_state_id, :work_city_id, :work_address, :special_condition, :special_condition_type_id, :terms_one, :terms_two, :password, :password_confirmation,
          subscribe_dependents_attributes: [:name, :nacionality, :_destroy, :cpf, :born, :born_state_id, :gender_id, :rg, 
          :rg_org, :rg_state_id, :rg_emission_date, :naturality, :civil_state_id, :income, :kinship_id, :special_condition, :special_condition_type_id, :cid, :nis, :id]
        )
    end

    def set_params_update
      params.require(:subscribe)
        .permit(
          :name, :gender_id, :born, :rg, :rg_org, :rg_state_id, :rg_emission_date, :born_state_id, :nacionality, :mother_name, :arrival_df, :civil_state_id, :income, :special_conditionfalse, :special_condition_type_idtrue, :cid, :nis, :celphone, :telephone, :email, :cep, :state_id, :city_id, :burgh, :address, :address_number, :address_complement, :work_cep, :work_state_id, :work_city_id, :work_address, :special_condition, :special_condition_type_id, :terms_one, :terms_two, :password, :password_confirmation,
          subscribe_dependents_attributes: [:name, :nacionality, :_destroy, :cpf, :born, :born_state_id, :gender_id, :rg, 
          :rg_org, :rg_state_id, :rg_emission_date, :naturality, :civil_state_id, :income, :kinship_id, :special_condition, :special_condition_type_id, :cid, :nis, :id]
        )      
    end

    def set_session_params
      params.require(:subscribe_session)
        .permit(:cpf, :password)
    end

    def current_subscribe
      ::Candidate::Subscribe.find_by(id: session[:candidate_subscribe_id])
    end

    def authenticate_subscriber!
      if current_subscribe.nil? && ['edit', 'update'].include?(action_name) 
        redirect_to candidate.new_session_subscribes_path
      end
    end
  end
end