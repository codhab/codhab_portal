require_dependency 'cpl_concurrence/application_controller'

module CplConcurrence
  class UserNoticeDocumentsController < ApplicationController
    before_action :authenticate_notice_user
    before_action :set_participation

    def create
      @user_document = CplConcurrence::NoticeUserDocument.where(notice_user_id: @participation.id).new(set_params)
      
      if @user_document.save
        flash[:success] = 'O Arquivo enviado com sucesso!' 
        redirect_to user_notice_participation_path(current_notice_user, @participation)
      else
        flash[:danger] = 'O Arquivo inválido, verifique o tamanho e tipo do arquivo enviado.' 
        redirect_to user_notice_participation_path(current_notice_user, @participation)
      end
    end 

    private

    def set_params
      params.require(:notice_user_document)
        .permit(:file,:proposal)
    end
    

    def set_participation
      @participation = CplConcurrence::NoticeUser.where(user_id: current_notice_user.id).find(params[:notice_participation_id])
    end

  end
end