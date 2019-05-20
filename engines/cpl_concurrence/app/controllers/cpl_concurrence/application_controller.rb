require_dependency 'application_controller'

module CplConcurrence
  class ApplicationController < ApplicationController
    protect_from_forgery with: :exception

    layout 'application'
  end
end
