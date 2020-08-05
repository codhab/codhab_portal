require_dependency 'regularization/application_controller'

module Regularization
  class VitoriaRegularizationSessionsController < ApplicationController
  
    def index
      redirect_to action: :new
    end 

    def new
      @session = Regularization::VitoriaRegularizationSession.new
    end
    
    def create
      @session = Regularization::VitoriaRegularizationSession.new(set_params)

      if @session.authenticate(session)
        redirect_to regularization.itapoa_regularization_path(@session.itapoa_regularization_id)
      else
        render action: :new
      end
    end

    private

    def set_params
      params.require(:vitoria_regularization_session).permit(:name, :cpf, :born)
    end

  end
end