module Entity
  class ApplicationController < ActionController::Base
    layout 'application'
    layout :set_layout

    helper ::ApplicationHelper
    helper_method :mobile_device?
    def test
      render json: 'funciona'
    end

    def set_layout
      mobile_device? ? "mobile" : "application"
    end

    def mobile_device?
      if session[:mobile_param]
        session[:mobile_param] == "1"
      else
        request.user_agent =~ /Mobile|webOS/
      end
    end

  end
end
