require_dependency 'main/application_controller'
module Main
	class TradingFloorParticipantsController < ApplicationController

		before_action :set_trading_floor


		def new
			@participant = @trading_floor.trading_floor_participants.new
		end

		def create
			@participant = @trading_floor.trading_floor_participants.new(trading_floor_params)
			if @participant.save
        send_file 'uploads/archive/files/'+@trading_floor.attachment,:type => 'application/pdf'
				# redirect_to 'http://www.codhab.df.gov.br/pagina/248'
			else
				render :new
			end
		end

		private

      def set_trading_floor
        @trading_floor = Main::TradingFloor.find(params[:trading_floor_id])
      end

			def trading_floor_params
				params.require(:trading_floor_participant).permit(:cnpj, :email, :phone, :social_name, :trading_floor_id)
			end
	end
end
