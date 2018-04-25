require_dependency 'application_controller'

module Firm
  class ApplicationController < ActionController::Base
    layout 'application'
    helper 'application'
  end
end
