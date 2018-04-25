require_dependency 'regularization/application_controller'

module Regularization
  class CadastresController < ApplicationController
    before_action :set_http_support

    def show
      #@candidate = ::Candidate::Cadastre.regularization.find_by_cpf(params[:id])
      @candidate = @http.get("/candidato/cadastros/#{params[:id]}.json")

    end

    def find_candidate
      @candidate = Candidate::Search.new
    end

    def show_candidate
      @candidate = Candidate::Search.new(set_search_params)

      if @candidate.valid?
        redirect_to cadastre_path(@candidate.cadastre_id)
      else
        render action: :find_candidate
      end

    end

    private

    def set_search_params
      params.require(:search).permit(:cpf)
    end

    def set_http_support
      server  = Rails.env.development? ? "http://localhost:3001" : "http://extranet.codhab.df.gov.br"
      @http   = HttpSupport.new(server, 'eed6a8780692be1675b1bd0f386ca8b0')
    end

  end
end
