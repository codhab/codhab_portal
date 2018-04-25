require_dependency 'application_helper'
module Mobilization
  class ApplicationController < ActionController::Base
    layout 'application'
    helper 'application'
    before_action :allow_iframe
    def allow_iframe
      response.headers.delete('X-Frame-Options')
    end
  end
end
