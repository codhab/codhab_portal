require_dependency 'cpl_competition/application_controller'

module CplCompetition
  class SessionsController < ApplicationController

    def index
    end 
  
    def new
      @session = CplCompetition::Session.new
    end 
    
    def create
      @session = CplCompetition::Session.new(set_params)

      if @session.valid?
        session[:cpl_session_user_id] = @session.id
        @session.write_log("Acesso realizado através do uso de senha pessoal")
        
        redirect_to cpl_competition.root_path
      else
        render action: :new
      end
    end 
    
    def destroy
      @session = CplCompetition::Session.new
      @session.id = session[:cpl_session_user_id]
      @session.write_log("Acesso finalizado pelo usuário")

      session[:cpl_session_user_id] = nil
      redirect_to cpl_competition.root_path
    end 

    private

    def set_params
      params.require(:session).permit(:cpf, :cnpj, :password, :session_type)
    end

  end 
end