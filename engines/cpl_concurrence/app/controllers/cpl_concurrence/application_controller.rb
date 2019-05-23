require_dependency 'application_controller'

module CplConcurrence
  class ApplicationController < ApplicationController
    protect_from_forgery with: :exception

    layout 'application'

    helper_method :current_notice_user, :authenticate_user

    private

    def authenticate_user
      if current_notice_user.nil? || controler_name != "sessions"
        redirect_to new_session_path
      end
    end


    def current_notice_user
      CplConcurrence::User.find_by(id: session[:user_notice_id])
    end
  end
end
