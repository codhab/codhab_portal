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
      @credential = @user_competition.competition_user_credentials.where(deleted: false).last
    end

    private
    
    def set_params
      params.require(:competition_user_credential).permit(:name, :cpf, :document, :credential_type, :regime_type)
    end 

    def set_competition_user
      @competition      = CplCompetition::Competition.find(params[:competition_id])
      @user_competition = current_user.competition_users.find_by(competition_id: @competition)      
    end

  end
end