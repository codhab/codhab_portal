require_dependency 'cpl_concurrence/application_controller'

module CplConcurrence
  class NoticeParticipationsController < ApplicationController
    before_action :authenticate_user
    
    def index
      @notices = CplConcurrence::Notice.all.order(:number)
    end 
  
  end 
end
