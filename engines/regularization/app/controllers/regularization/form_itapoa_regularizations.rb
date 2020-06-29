require_dependency 'regularization/application_controller'

module Regularization
  class FormItapoaRegularizations < ApplicationController 

    def index
    end
    
    def new
      @itapoa_regularization = Regularization::ItapoaRegularizationForm.new
    end
    
    def create
      @itapoa_regularization = Regularization::ItapoaRegularizationForm.new(set_params)

      if @itapoa_regularization.persist!
        render 'success'
      else
        render action: :new
      end
    end

    def show
      @itapoa_regularization = Regularization::ItapoaRegularization.where(cpf: params[:cpf])
    end

    private

    def set_params
      params.require(:itapoa_regularization).permit(:name)
    end

  end
end