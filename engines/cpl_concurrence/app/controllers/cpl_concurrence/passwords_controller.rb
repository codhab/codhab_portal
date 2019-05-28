require_dependency 'cpl_concurrence/application_controller'

module CplConcurrence
  class PasswordsController < ApplicationController
    before_action :authenticate_notice_user

    def edit
      @user_password = CplConcurrence::Password.new(user_id: current_notice_user.id)
    end 
    
    def update
      @user_password = CplConcurrence::Password.new(set_params)
      @user_password.user_id = current_notice_user.id
      @user_password.save
    end 

    private

    def set_params
      params.require(:password)
        .permit(:new_password, :confirmation_password, :current_password)
    end 

  end
end