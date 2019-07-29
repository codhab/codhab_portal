require_dependency 'application_controller'

module CplConcurrence
  class ApplicationController < ApplicationController
    protect_from_forgery with: :exception
    after_action :set_iframe

    layout 'application'

    helper_method :current_notice_user, :authenticate_notice_user

    private

    def authenticate_notice_user
      if current_notice_user.nil? && controller_name != "sessions"
        redirect_to new_session_path
      end
    end


    def current_notice_user
      ::CplConcurrence::User.find_by(id: session[:user_notice_id])
    end

    def set_iframe
      response.headers["X-FRAME-OPTIONS"] = "ALLOWALL"
    end
  end
end
