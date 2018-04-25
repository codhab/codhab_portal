require_dependency 'social_work_cadastre/application_controller'

module SocialWorkCadastre
  class SessionsController < ApplicationController # :nodoc:
    layout 'layouts/social_work_cadastre/application'

    def index
      redirect_to new_session_path
    end

    def new
      @session = Core::SocialWorkCadastre::Session.new
    end

    def create
      @session = Core::SocialWorkCadastre::Session.new(set_params)

      if @session.valid?
        session[:current_external_company_id] = nil
        session[:current_external_company_id] = @session.id

        redirect_to social_work_cadastre.show_path
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
      params.require(:social_work_cadastre_session).permit(:cnpj, :password)
    end

    def set_session
      @session = Core::SocialWorkCadastre::Session.find(params[:id])
    end
  end
end
