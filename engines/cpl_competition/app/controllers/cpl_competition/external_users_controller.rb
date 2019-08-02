require_dependency 'cpl_competition/application_controller'

module CplCompetition
  class ExternalUsersController < ApplicationController


    def new
      @user = CplCompetition::ExternalUser.new
    end 
    
    def create
      @user = CplCompetition::ExternalUser.new(set_params)

      if @user.save
        CplCompetition::CompetitionMailer.confirmation(@user, @user.email).deliver_now! 
        redirect_to cpl_competition.new_session_path
      else
        render action: :new 
      end
    end 

    def confirmation 
      @user = CplCompetition::User.find_by(confirmation_token: params[:external_user_id])
      
      if !@user.nil?
        @notice = 'Seu e-mail foi confirmado'
        @user.update(confirmation: true, confirmation_token: nil)
      end
      
      session[:cpl_session_user_id] = nil

      redirect_to cpl_competition.new_session_path
    end

    def send_confirmation
      CplCompetition::CompetitionMailer.confirmation(current_user, current_user.email).deliver_now! 
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