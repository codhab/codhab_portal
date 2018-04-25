require_dependency 'application_helper'
module Assistance
  class ApplicationController < ActionController::Base
    layout 'application'
    helper 'application'
  end
end
