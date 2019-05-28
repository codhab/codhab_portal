require_dependency 'cpl_concurrence/application_controller'

module CplConcurrence
  class UserNoticeParticipationChatsController < ApplicationController
    before_action :authenticate_notice_user
    
    def index
    end 
    
  end
end