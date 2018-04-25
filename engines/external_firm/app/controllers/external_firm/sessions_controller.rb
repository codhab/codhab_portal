require_dependency 'external_firm/application_controller'

module ExternalFirm
  class SessionsController < ApplicationController
    def new
      @session = ExternalFirm::Session.new
    end

    def create
      @session = ExternalFirm::Session.new(set_params)

      if @session.valid?
        session[:current_external_company_id] = @session.id

        redirect_to external_firm.cadastres_path
      else
        render action: :new
      end
    end

    def logout
      session[:current_external_company_id] = nil

      redirect_to action: :new
    end

    private

    def set_params
      params.require(:session).permit(:email, :password)
    end

    def set_session
      @session = ExternalFirm::Session.find(params[:id])
    end
  end
end
