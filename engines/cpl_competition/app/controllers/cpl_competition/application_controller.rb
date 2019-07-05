module CplCompetition
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_user, :authenticate!

    private

    def current_user
      CplCompetition::User.find_by(id: session[:cpl_session_user_id])
    end

    def authenticate!
      if current_user.nil? && controller_name != "sessions"
        redirect_to cpl_competition.new_session_path
      end
    end
  end
end
