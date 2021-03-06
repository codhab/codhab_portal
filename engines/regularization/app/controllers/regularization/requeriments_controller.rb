require_dependency 'regularization/application_controller'

module Regularization
  class RequerimentsController < ApplicationController
    before_action :address_present!, except: [:new_address, :set_address]
    before_action :set_unit, only: [:new, :create]
    before_action :reset_session!, only: [:new_address]
    before_action :add_cors_headers

    def new_address
      @address = Regularization::Address.new
    end

    def set_address
      @address = Regularization::Address.new(set_address_params)

      if @address.valid?
          session[:address_id] = @address.id
          redirect_to regularization_portal.new_requeriment_path
      else
        render action: 'new_address'
      end
    end

    def show
      @requeriment = Regularization::Requeriment.find(session[:requeriment_id])
    end

    def new
      @requeriment = Regularization::Requeriment.new
    end

    def success
      @requeriment = Regularization::Requeriment.find(session[:requeriment_id])
    end

    def create
      @requeriment = Regularization::Requeriment.new(set_params)
      @requeriment.unit_id = session[:address_id]

      if @requeriment.save
        session[:requeriment_id] = @requeriment.id
        flash[:success] = t :success
        redirect_to success_requeriments_path
      else
        render action: 'new'
      end
    end

    private

    def set_params
      params.require(:requeriment).permit(:name, :cpf, :rg, :email, :nacionality, :martial_status,
                                          :gender, :born, :telephone, :celphone, :complete_address,
                                          :income, :income, :spouse_name, :spouse_cpf, :owner,
                                          :marital_status, :nationality)
    end

    def address_present!
      redirect_to action: 'new_address' if !session[:address_id].present?
    end

    def set_requeriment_params
      params.require(:requeriment).permit(:name)
    end

    def set_address_params
      params.require(:address).permit(:city, :block, :group, :unit, :id)
    end

    def set_unit
      @address = ::Address::Unit.find(session[:address_id]) if session[:address_id].present?
    end

    def add_cors_headers
      origin = request.headers["Origin"]
      unless (not origin.nil?) and (origin == "http://localhost" or origin.starts_with? "http://localhost:")
        origin = "http://extranet.codhab.df.gov.br"
      end
      headers['Access-Control-Allow-Origin'] = origin
      headers['Access-Control-Allow-Methods'] = 'POST, GET'
      allow_headers = request.headers["Access-Control-Request-Headers"]
      if allow_headers.nil?
        #shouldn't happen, but better be safe
        allow_headers = 'Origin, Authorization, Accept, Content-Type'
      end
      headers['Access-Control-Allow-Headers'] = allow_headers
      headers['Access-Control-Allow-Credentials'] = 'true'
      headers['Access-Control-Max-Age'] = '1728000'
    end

    def reset_session!
      session[:address_id]      = nil
      session[:requeriment_id]  = nil
    end
  end
end
