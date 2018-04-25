require_dependency 'attendance/application_controller'

module Attendance
  class NotificationsController < ApplicationController
    
    def index
    end

    def show
      @notification = current_cadastre.notifications.find(params[:id])
      @notification.update(read: true)
    end
    
  end
end