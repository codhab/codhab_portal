require_dependency 'application_controller'
require_dependency 'application_helper'

module Protocol
  class ApplicationController < ApplicationController
    include SimpleCaptcha::ControllerHelpers
    
    layout 'application'

    helper ApplicationHelper
  end
end
