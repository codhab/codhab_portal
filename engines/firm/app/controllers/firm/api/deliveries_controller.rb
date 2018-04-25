require_dependency 'firm/application_controller'

module Firm
  module Api
    class DeliveriesController < ApplicationController

      def create
        @delivery = Firm::Delivery.new(set_params)

        if @delivery.valid?
          service  = Firm::SellingService.new(@delivery.cadastre, @enterprise_unit, nil)
          service.delivery!(@delivery.observation, @delivery.file_path)

          render json: { status: 'success', reference_code: @delivery.id }
        else
          render json: { status: 'error', errors: @delivery.errors.messages }
        end

      end

      private

      def set_params
        params.fetch(:delivery, {}).permit(:cpf, :observation, :file_path, :unit_id)
      end
    end
  end
end
