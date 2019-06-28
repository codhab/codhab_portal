class ExternalInvoicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def external_return
    request.headers["Content-Type"] = 'json/'
    
    json_data = BrbFile.file_return
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

  def external_file
    send_file "#{Rails.root}/brb_file/RECEPÇÃO/#{params[:file]}.txt"
  rescue 
    nil
  end

end