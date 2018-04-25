require_dependency 'application_helper'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :allow_iframe
  before_action :add_cors_headers



  def allow_iframe
    response.headers.delete('X-Frame-Options')
  end

  def current_user_company
    Firm::UserCompany.find(session[:firm_auth_id]) rescue nil
  end

  def current_social_user
    Core::SocialWork::CompanyUser.find(session[:user_auth_id]) rescue nil
  end

  def add_cors_headers
    origin = request.headers["Origin"]
    unless (not origin.nil?) and (origin == "http://localhost" or origin.starts_with? "http://localhost:")
      origin = "http://extranet.codhab.df.gov.br"
    end
    headers['Access-Control-Allow-Origin'] = origin
    headers['Access-Control-Allow-Methods'] = 'POST, GET'
    allow_headers = request.headers["Access-Control-Request-Headers"]
    if allow_headers.nil?
      #shouldn't happen, but better be safe
      allow_headers = 'Origin, Authorization, Accept, Content-Type'
    end
    headers['Access-Control-Allow-Headers'] = allow_headers
    headers['Access-Control-Allow-Credentials'] = 'true'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  def authenticate_social_user!
    if current_social_user.nil? && controller_name != "authorization"
      redirect_to social_work.new_authorization_path
    end

  end

  helper_method :current_user_company
  helper_method :current_social_user
  helper_method :authenticate_social_user!
end
