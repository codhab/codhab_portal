require_dependency 'firm/application_controller'

module Firm
  module Api
    class RefundsController < ApplicationController

      def create
        @refund = Firm::Refund.new
        @refund.cpf = params[:cpf]
        @refund.observation = params[:observation]
        @refund.file_path = params[:file_path]
        @refund.unit_id = params[:unit_id]

        @unit = ::Address::Unit.find_by_control_number(@refund.unit_id)
        @refund.unit_id = @unit.id

        if @refund.valid?
          @project = ::Firm::UserCompany.find(13)
          service = Firm::RefundService.new(@refund.cadastre, @unit, @project)
          service.refund!(@refund.observation, @refund.file_path)

          render json: { status: 'success', reference_code: @refund.cpf }
        else
          render json: { status: 'error', errors: @refund.errors.messages }
        end

      end

      private

      def set_params
        params.fetch(:refund).permit(:cpf, :observation, :file_path, :unit_id)
      end
    end
  end
end
