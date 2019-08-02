module CplCompetition
  class CompetitionUserProposalsController < ApplicationController
    skip_before_filter :verify_authenticity_token  
    before_action :set_competition_user

    def create
      @proposal = @user_competition.competition_user_participations.where(partipation_type: 1).new(set_params)

      if @proposal.save
        redirect_to cpl_competition.competition_user_path(@competition, @user_competition)
      else
        @document   = @user_competition.competition_user_participations.where(partipation_type: 0).new
        @credential = @user_competition.competition_user_credentials.new 
        
        render 'cpl_competition/competition_users/show'
      end
    end
    
    def destroy
      @proposal = @user_competition.competition_user_participations.where(partipation_type: 1).find(params[:id])
      @proposal.update(deleted: true, deleted_at: Time.now) 
      
      redirect_to cpl_competition.competition_user_path(@competition, @user_competition)
    end

    def show
      event = @competition.competition_events.new(
        description: "Usuário #{current_user.name} abriu envelope 2 do participante #{@user_competition.user.name}",
        user_id: current_user.id,
        event_type: 'histórico'
      )

      event.save

      @proposals = @user_competition.competition_user_participations.where(partipation_type: 1, deleted: false)
    end

    private

    def set_competition_user
      @competition      = CplCompetition::Competition.find(params[:competition_id])
      @user_competition = @competition.competition_users.find_by(user_id: current_user.id)
    end

    def set_params
      params.require(:competition_user_participation).permit(:document) 
    end

  end
end