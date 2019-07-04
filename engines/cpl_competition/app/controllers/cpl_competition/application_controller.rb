module CplCompetition
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_user

    private

    def current_user
      CplCompetition::User.find_by(id: session[:cpl_session_user_id])
    end
  end
end
