module Candidate
  class SubscribeConsultsController < ApplicationController
    
    def index
      redirect_to action: :new
    end 

    def new
      @cadastre = Candidate::SubscribeConsult.new
    end 
    
    def create
      @cadastre = Candidate::SubscribeConsult.new(set_params)

      if !@cadastre.save
        render action: :new
      else
        @subscribe = @cadastre.cadastre
      end
    end

    private

    def set_params
      params.require(:subscribe_consult)
        .permit(:cpf)
    end 
  end
end