class ExternalInvoicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def external_return
    request.headers["Content-Type"] = 'json/'

    json_data = [{ 'remessa': '2019-01-01', arquivo: 'http://www.codhab.df.gov.br/uploads/archive/files/5f3c04ee96f7401a4e89c7914017d100.png'}]

    render json: json_data, status: 200
  end

  def external_remmitance

    if !params[:document].present?
      json_data = { status: 406, message: 'arquivo não foi processado' , errors: ["arquivo é obrigatório"] }
    else 
      json_data = { status: 200, message: 'arquivo processado com sucesso' , errors: [] }
    end

    render json: json_data, status: 200
  end

end