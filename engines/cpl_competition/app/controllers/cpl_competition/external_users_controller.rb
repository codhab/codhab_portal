require_dependency 'cpl_competition/application_controller'

module CplCompetition
  class ExternalUsersController < ApplicationController


    def new
      @user = CplCompetition::ExternalUser.new
    end 
    
    def create
      @user = CplCompetition::ExternalUser.new(set_params)

      if @user.save
        redirect_to cpl_competition.new_session_path
      else
        render action: :new 
      end
    end 

    private

    def set_params
      params.require(:external_user).permit(:name, :cnpj, :password, :password_confirmation, :telephone, :email, :email_confirmation)
    end

    def set_update_params
      params.require(:external_user).permit(:telephone, :email, :email_confirmation)
    end
  end 
end