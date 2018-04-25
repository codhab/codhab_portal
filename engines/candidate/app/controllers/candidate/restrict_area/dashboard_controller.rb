require_dependency 'candidate/application_controller'

module Candidate
  module RestrictArea
    class DashboardController < ApplicationController
      before_action :authenticate_cadastre
      before_action :set_cadastre

      def index
        @cadastre_view = http_support.get("/candidato/cadastros/#{@cadastre.id}.json")
        @tickets_ref = ::Candidate::CadastreReferences.where(cpf: @cadastre.cpf, code: 'convocation_1000')
        @asking = ::Candidate::Asking.new
      end

      private

      def set_cadastre
        @cadastre = ::Candidate::Cadastre.find(session[:cadastre_id]) rescue nil
      end


      def http_support
        server  = Rails.env.development? ? "http://localhost:3001" : "http://extranet.codhab.df.gov.br"
        @http   = HttpSupport.new(server, 'eed6a8780692be1675b1bd0f386ca8b0')
      end

    end
  end
end
