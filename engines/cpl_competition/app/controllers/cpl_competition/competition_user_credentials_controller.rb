module CplCompetition
  class CompetitionUserCredentialsController < ApplicationController
    before_action :set_competition_user

    def create
      @credential = @user_competition.competition_user_credentials.new(set_params)

      if @credential.save
        redirect_to cpl_competition.competition_user_path(@competition, @user_competition)
      else
        @document   = @user_competition.competition_user_participations.where(partipation_type: 0).new
        @proposal   = @user_competition.competition_user_participations.where(partipation_type: 1).new
  
        render 'cpl_competition/competition_users/show'
      end
    end 

    def destroy
      @credential = @user_competition.competition_user_credentials.find(params[:id])
      @credential.update(deleted: true, deleted_at: Time.now) 
      
      redirect_to cpl_competition.competition_user_path(@competition, @user_competition)      
    end
    
    def show
      if !current_user.nil? && current_user.administrator
        event = @competition.competition_events.new(
          description: "Usuário #{current_user.name} abriu informações de credenciamentodo participante #{@user_competition.user.name}",
          user_id: current_user.id,
          event_type: 'histórico'
        )
      
        event.save
      end

      @credential = @user_competition.competition_user_credential
    end

    private
    
    def set_params
      params.require(:competition_user_credential).permit(:name, :cpf, :document, :credential_type, :regime_type)
    end 

    def set_competition_user
      @competition      = CplCompetition::Competition.find(params[:competition_id])
      @user_competition = @competition.competition_users.find_by(user_id: params[:user_id])      
    end

  end
end