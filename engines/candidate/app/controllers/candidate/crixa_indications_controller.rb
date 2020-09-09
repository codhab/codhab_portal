module Candidate
  class CrixaIndicationsController < ApplicationController
    layout 'mobile'

    def new
      session[:crixa_indication_id] = nil

      @crixa_indication = ::Candidate::CrixaIndicationForm.new
    end
    
    def create
      @crixa_indication = ::Candidate::CrixaIndicationForm.new(set_params)

      if @crixa_indication.valid?
        session[:crixa_indication_id] = @crixa_indication.cadastre_id

        redirect_to candidate.show_indicacao_crixa_path
      else
        render action: :new
      end
    end

    def show
      @cadastre = ::Candidate::Cadastre.find_by(id: session[:crixa_indication_id])
      
      if @cadastre.nil? 
        redirect_to candidate.indicacao_crixa_path
      end
    end
    
    def negative_new
      @cadastre = ::Candidate::Cadastre.find_by(id: session[:crixa_indication_id])
      
      if @cadastre.nil?
        redirect_to candidate.indicacao_crixa_path 
      else 
        @negative_crixa_indication = ::Candidate::NegativeCrixaIndicationForm.new(cadastre_id: @cadastre.id)
      end
    end
    
    def negative_create
      @cadastre = ::Candidate::Cadastre.find_by(id: session[:crixa_indication_id])
      
      
      if @cadastre.nil?
        redirect_to candidate.indicacao_crixa_path 
      else
        
        @negative_crixa_indication = ::Candidate::NegativeCrixaIndicationForm.new(set_negative_params)
        @negative_crixa_indication.cadastre_id = @cadastre.id
        
        if !@negative_crixa_indication.save
          render action: :negative_new
        else 
          session[:crixa_indication_id] = nil
          render 'negative_create'
        end
      end

    end

    private

    def set_params
      params.require(:crixa_indication_form).permit(:cpf, :born)
    end
    
    def set_negative_params
      params.require(:negative_crixa_indication_form).permit(:observation)
    end

  end
end