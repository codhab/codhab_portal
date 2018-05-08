module Firm
  module Api
    class CandidatesController < ApiController
      
      def index
        @indications = current_company.enterprise_cadastres.includes(:cadastre)
      end    
        
      def show
        @candidate  = current_company.cadastres.find_by(cpf: params[:id]) rescue nil

        render json: { error: "CPF não encontrado" } if @candidate.nil?
      end

    end
  end
end