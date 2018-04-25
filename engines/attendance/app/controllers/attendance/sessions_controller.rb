require_dependency 'attendance/application_controller'

module Attendance
  class SessionsController < ApplicationController
    before_action :session_present?, except: :destroy

    layout 'application'
    
    def new
      @session = Attendance::Session.new
    end

    def create
      @session = Attendance::Session.new(set_params)

      if @session.valid?
        session[:current_cadastre_id] = @session.id
        redirect_to attendance.root_path
      else
        render action: :new
      end
    end

    def destroy
      session[:current_cadastre_id] = nil
      redirect_to attendance.root_path
    end
  
    private

    def set_params
      params.require(:session).permit(:cpf, :password)    
    end

    def session_present?
      if !session[:current_cadastre_id].nil?
        redirect_to attendance.root_path
      end
    end    
  end
end