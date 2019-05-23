require_dependency 'cpl_concurrence/application_controller'

module CplConcurrence
  class SessionsController < ApplicationController
    
    def index
      redirect_to action: :new
    end
    
    def new
      @session = CplConcurrence::Session.new
    end 
    
    def create
      @session = CplConcurrence::Session.new(set_params)

      if @session.save
        session[:user_notice_id] = @session.user_id
        redirect_to cpl_concurrence.user_notices_path(@session.user_id)
      else
        render action: :new
      end
    end 

    def destroy 
      session[:user_notice_id] = nil

      redirect_to cpl_concurrence.new_session_path
    end

    private

    def set_params
      params.require(:session).permit(:cpf_cnpj, :password)
    end

  end
end