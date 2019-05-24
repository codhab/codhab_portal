require_dependency 'cpl_concurrence/application_controller'

module CplConcurrence
  class UsersController < ApplicationController
    #before_action :authenticate_user
    
    def new
      @user = CplConcurrence::User.new
    end 
    
    def create
      @user = CplConcurrence::User.new(set_params)

      if !@user.save 
        render action: :new
      end
    end 

    def show
      @user = current_notice_user
      @logs = CplConcurrence::NoticeUserLog.where(user_id: current_notice_user.id, notice_id: nil).order(created_at: :desc)
    end

    private

    def set_params
      params.require(:user).permit(:name, :cpf, :cnpj, :email, :telephone, :email_confirmation, :password, :password_confirmation)
    end 
    
  end
end