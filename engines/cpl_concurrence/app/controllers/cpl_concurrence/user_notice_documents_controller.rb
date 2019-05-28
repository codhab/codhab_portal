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

    def index
      @user_document = CplConcurrence::NoticeUserDocument.where(notice_user_id: @participation.id).find_by(document: params[:id])
      
      if @user_document.nil?
        flash[:danger] = 'O Arquivo não encontrado'
        redirect_to user_notice_participation_path(current_notice_user, @participation)
      else
        send_file "#{Rails.root}/public#{@user_document.document_url}"
      end
      
    end
    
    def destroy 
      @user_document = CplConcurrence::NoticeUserDocument.where(notice_user_id: @participation.id).find_by(id: params[:id])
      @user_document.update(deleted: true, deleted_at: Time.now)

      flash[:success] = 'O Arquivo removido com sucesso!'
      redirect_to user_notice_participation_path(current_notice_user, @participation)
    end

    private

    def set_params
      params.require(:notice_user_document)
        .permit(:document,:proposal)
    end
    

    def set_participation
      @participation = CplConcurrence::NoticeUser.where(user_id: current_notice_user.id).find(params[:notice_participation_id])
    end

  end
end