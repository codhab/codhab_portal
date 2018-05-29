module Certificate
  class ApplicationController < ActionController::Base # :nodoc:
    protect_from_forgery with: :exception
    layout 'application'
    helper 'application'
  end
end
