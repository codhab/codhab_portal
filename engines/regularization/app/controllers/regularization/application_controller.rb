module Regularization
  class ApplicationController < ActionController::Base
    layout 'application'
    helper 'application'
    
    helper_method :mobile_device?
    
    private
    
    def mobile_device?
      if session[:mobile_param]
        session[:mobile_param] == "1"
      else
        request.user_agent =~ /Mobile|webOS/
      end
    end

  end
end
