require_dependency 'firm/application_controller'

module Firm
  module Api
    class SellingsController < ApplicationController

      def create
        @selling = Firm::Selling.new(set_params)
        @unit = ::Address::Unit.find_by_control_number(@booking.unit_id)
        @selling.unit_id = @unit.id
        if @selling.valid?
          service = Firm::SellingService.new(@selling.cadastre, @unit, 13)
          service.sell!(@selling.observation, @selling.file_path)

          render json: { status: 'success', reference_code: @selling.complete_address }
        else
          render json: { status: 'error', errors: @selling.errors.messages }
        end

      end

      private

      def set_params
        params.fetch(:selling, {}).permit(:cpf, :observation, :file_path, :unit_id)
      end
    end
  end
end
