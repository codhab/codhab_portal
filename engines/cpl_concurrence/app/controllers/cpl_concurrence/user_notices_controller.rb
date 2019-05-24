require_dependency 'cpl_concurrence/application_controller'

module CplConcurrence
  class UserNoticesController < ApplicationController
    before_action :authenticate_notice_user
    
    def index
      @notices = CplConcurrence::Notice.where(status: true).order(:number)
    end 

    def show
    end 

  end
end