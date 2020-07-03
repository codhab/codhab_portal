require_dependency 'regularization/application_controller'

module Regularization
  class FormItapoaRegularizationsController < ApplicationController 

    def index
    end
    
    def new
      @itapoa_regularization = Regularization::FormItapoaRegularization.new
    end
    
    def create
      @itapoa_regularization = Regularization::FormItapoaRegularization.new(set_params)

      if @itapoa_regularization.save
        render 'success'
      else
        render action: :new
      end
    end

    def show
      @itapoa_regularization = Regularization::FormItapoaRegularization.where(cpf: params[:cpf])
    end

    private

    def set_params
      params.require(:form_itapoa_regularization).permit(:name)
    end

  end
end