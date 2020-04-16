require_dependency 'candidate/application_controller'

module Candidate
  class SubscribesController < ApplicationController
    
    def index
      redirect_to action: :new
    end 

    def new
      @cadastre = Candidate::Subscribe.new
    end 
    
    def create
      @cadastre = Candidate::Subscribe.new(set_params)

      if @cadastre.save
      else
        flash[:danger] = 'Ops... verifique os dados informados em vermelho.'
        render action: :new
      end
    end 

    def show
    end 

    private

    def set_params
      params.require(:subscribe)
        .permit(
          :name,
          subscribe_dependents_attributes: [:name]
        )
    end
  end
end