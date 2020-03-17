class IndicationsController < ApplicationController

  def create
    @indication = ::Indication.new(set_params)
    @indication.save
  end

  private

  def set_params
    params.require(:indication).permit(:cpf, :password)
  end

end