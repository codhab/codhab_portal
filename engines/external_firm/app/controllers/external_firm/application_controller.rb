module ExternalFirm
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_external_company

    layout 'application'
    helper 'application'

    private

    def current_external_company
      ExternalFirm::User.find(session[:current_external_company_id])
    rescue StandardError
      nil
    end
  end
end
