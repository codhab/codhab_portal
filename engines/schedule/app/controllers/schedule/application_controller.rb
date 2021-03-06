require_dependency 'application_helper'
require_dependency 'application_controller'

module Schedule
  class ApplicationController < ApplicationController
    layout 'application'
    helper 'application'
    before_action :allow_iframe

    def mobile_device?
      if session[:mobile_param]
        session[:mobile_param] == "1"
      else
        request.user_agent =~ /Mobile|webOS/
      end
    end


    def allow_iframe
      response.headers.delete('X-Frame-Options')
    end

    helper_method :mobile_device?

    def prepare_for_mobile
      session[:mobile_param] = params[:mobile] if params[:mobile]
      request.format = :mobile if mobile_device?
    end
  end
end
