class ExternalInvoicesController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout 'empty'
  
  def external_return
    request.headers["Content-Type"] = 'json/'
    
    @json_data = BrbFile.file_return
  end

  def external_remmitance
    @document = ::ExternalRemmitance.new
    @document.document = params[:document]
  
    if @document.store!
      json_data = { status: 200, message: 'arquivo processado com sucesso' , errors: [] }
    else 
      json_data = { status: 406, message: 'arquivo não foi processado' , errors: @document.errors.full_messages }
    end

    render json: json_data, status: 200
  end

  def external_file
    send_file "#{Rails.root}/brb_file/RECEPÇÃO/#{params[:file]}.txt"
  rescue 
    nil
  end

end