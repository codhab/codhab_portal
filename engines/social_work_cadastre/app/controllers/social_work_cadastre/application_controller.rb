module SocialWorkCadastre
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    layout 'application'
    helper 'application'

    private

    def current_external_company
      Core::SocialWorkCadastre::Cadastre.find(session[:current_external_company_id])
    rescue StandardError
      nil
    end
  end
end
