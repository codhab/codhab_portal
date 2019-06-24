require_dependency 'cpl_concurrence/application_controller'

module CplConcurrence
  class UserNoticeParticipationsController < ApplicationController
    before_action :authenticate_notice_user
    
    def index
      @notices = CplConcurrence::NoticeUser.where(user_id: current_notice_user.id)
    end

    def show
      @participation = CplConcurrence::NoticeUser.where(user_id: current_notice_user.id).find(params[:id])
      @notice = CplConcurrence::Notice.find(@participation.notice_id)
      @logs = CplConcurrence::NoticeUserLog.where(user_id: current_notice_user.id, notice_id: @notice.id).order(created_at: :desc)
    end
    
    def session_participation
      @participation = CplConcurrence::NoticeUser.where(user_id: current_notice_user.id).find(params[:notice_participation_id])
      @notice = CplConcurrence::Notice.find(@participation.notice_id)
    end

    def proposal
    
    end 

    def document
    end


    def new
      @notice = CplConcurrence::NoticeUser.new(user_id: current_notice_user.id)
      @notice.notice_id = params[:notice_id]
      
      if @notice.save
        redirect_to user_notice_participation_path(current_notice_user, @notice.id)
      else
        flash[:danger] = 'Participação não disponível'
        redirect_to user_notices_path(current_notice_user)
      end
    end
  
  end 
end
