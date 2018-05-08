require_dependency 'main/application_controller'

module Main
  class TradingFloorsController < ApplicationController


    def index
      @trading_floors = Main::TradingFloor.where(status: true)
    end

    def show
      @trade = Main::TradingFloor.find(params[:id])
      respond_to do |format|
        format.html
        format.json {
          render json: @trade
        }
      end
    end

  end
end
