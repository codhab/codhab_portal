module Firm
  module Api
    class UnitsController < ApiController

      def index
        @units = current_company.units
      end

      def show
        @unit  = current_company.units.where('address_units.id = ? OR address_units.control_number', params[:id], params[:id]).first
      end      
    end
  end
end
