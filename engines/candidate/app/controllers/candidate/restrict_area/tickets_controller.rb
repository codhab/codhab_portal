require_dependency 'candidate/application_controller'

module Candidate
  module RestrictArea
    class TicketsController < ApplicationController
      before_action :authenticate_cadastre
      before_action :set_cadastre
#
      def index
         @tickets = ::Candidate::Ticket.where(cadastre_id: @cadastre.id).order("created_at DESC")
         @tickets_closed = ::Candidate::Ticket.where(cadastre_id: @cadastre.id, status: 0, status: 1)
         @tickets_ref = ::Candidate::CadastreReferences.where(cpf: @cadastre.cpf, code: 'convocation_1000')
      end

      def show
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
