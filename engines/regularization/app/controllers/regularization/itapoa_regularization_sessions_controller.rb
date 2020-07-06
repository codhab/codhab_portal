require_dependency 'regularization/application_controller'

module Regularization
  class ItapoaRegularizationSessionsController < ApplicationController
  
    def index
      redirect_to action: :new
    end 

    def new
      @session = Regularization::ItapoaRegularizationSession.new
    end
    
    def create
      @session = Regularization::ItapoaRegularizationSession.new(set_params)

      if @session.authenticate(session)
        redirect_to regularization.itapoa_regularization_path(@session.itapoa_regularization_id)
      else
        render action: :new
      end
    end

    private

    def set_params
      params.require(:itapoa_regularization_session).permit(:name, :cpf, :born)
    end

  end
end