class CustomPagesController < ApplicationController
  layout 'custom'

  before_action :set_days

  def index
    cookies[:recadastre_deny] = "true"
    
    redirect_to main_app.root_path
  end

  def new
    @cadastre = ::Cadastre.new
  end

  def create
    @cadastre = ::Cadastre.new(set_params)
  end

  def sheet_2017

    render layout: 'application'
  end

  private
  
  def set_days
    @counter_days = (Date.parse('2017-07-31') - Date.current).to_i
  end

  def set_params
    params.require(:cadastre).permit(:cpf)
  end

end
