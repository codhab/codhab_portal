require_dependency 'firm/application_controller'

module Firm
  module Api
    class BookingsController < ApplicationController

      def create
        
        @booking = Firm::Booking.new
        @booking.cpf = params[:cpf]
        @booking.observation = params[:observation]
        @booking.file_path = params[:file_path]
        @booking.unit_id = params[:unit_id]

        @unit = ::Address::Unit.find_by_control_number(@booking.unit_id)
        @booking.unit_id = @unit.id
        if @booking.valid?
          service = Firm::BookingService.new(@booking.cadastre, @unit, 13)
          service.book!(@booking.observation, @booking.file_path)
          render json: { status: 'success', reference_code: @unit.complete_address }
        else
          render json: { status: 'error', errors: @booking.errors.messages }
        end
      end


      private

      def set_params
        params.fetch(:booking, {}).permit(:cpf, :observation, :file_path, :unit_id)
      end
    end
  end
end
