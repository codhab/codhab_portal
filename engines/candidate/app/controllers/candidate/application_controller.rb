require_dependency 'application_helper'

module Candidate
  class ApplicationController < ActionController::Base

    before_action :add_cors_headers
    before_action :allow_iframe
    layout :set_layout

    helper ::ApplicationHelper

    helper_method :mobile_device?
    helper_method :authenticate_cadastre

    private

    def authenticate_cadastre
      if mobile_device?
        if params[:cpf].present?
          @cadastre = ::Candidate::Cadastre.find_by(cpf: params[:cpf]) rescue nil
          session[:cadastre_id] = @cadastre.id if @cadastre.present?
        elsif params[:cpf].to_s == 'false'
          session[:cadastre_id] = nil
        end
      end

      redirect_to new_restrict_area_session_path if !session[:cadastre_id].present? 
    end

    def set_layout
      mobile_device? ? "mobile" : "application"
    end

    def allow_iframe
      response.headers.delete('X-Frame-Options')
    end

    def mobile_device?
      if session[:mobile_param]
        session[:mobile_param] == "1"
      else
        request.user_agent =~ /Mobile|webOS/
      end
    end

    def add_cors_headers
      origin = request.headers["Origin"]
      unless (not origin.nil?) and (origin == "http://localhost" or origin.starts_with? "http://localhost:")
        origin = "http://www.codhab.df.gov.br:81"
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

  end
end
