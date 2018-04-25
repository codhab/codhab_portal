module TechnicalAssistance
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    layout 'application'
    helper 'application'
  end
end
