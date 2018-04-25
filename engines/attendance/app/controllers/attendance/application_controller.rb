require_dependency 'application_helper'
require_dependency 'application_controller'

module Attendance
  class ApplicationController < ApplicationController
    protect_from_forgery with: :exception
    #before_action :urgent_redirect

    helper ApplicationHelper

    layout 'attendance'

    helper_method :authenticate_cadastre!
    helper_method :current_cadastre


    private

    def urgent_redirect
      redirect_to attendance.new_session_path if controller_name != 'sessions'
    end


    def authenticate_cadastre!
      if !current_cadastre.present?
        redirect_to attendance.new_session_path
      end
    end

    def current_cadastre
      @cadastre = Core::Candidate::Cadastre.find(session[:current_cadastre_id]) rescue nil

      return nil if @cadastre.nil?

      @cadastre = Core::Candidate::CadastrePresenter.new(@cadastre) rescue nil
      @cadastre = Core::Attendance::CadastrePresenter.new(@cadastre) rescue nil
      @cadastre = Core::Attendance::CadastrePolicy.new(@cadastre) rescue nil
    end

  end
end
