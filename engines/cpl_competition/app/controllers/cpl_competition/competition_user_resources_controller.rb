module CplCompetition
  class CompetitionUserResourcesController < ApplicationController
    skip_before_filter :verify_authenticity_token  
    before_action :set_competition_user

    def create
      @document = @user_competition.competition_user_participations.where(partipation_type: 3).new(set_params)

      if @document.save
        redirect_to cpl_competition.competition_user_path(@competition, @user_competition)
      else
        @proposal   = @user_competition.competition_user_participations.where(partipation_type: 1).new
        @credential = @user_competition.competition_user_credentials.new 
        
        render 'cpl_competition/competition_users/show'
      end
    end
    
    def destroy
      @document = @user_competition.competition_user_participations.where(partipation_type: 3).find(params[:id])
      @document.update(deleted: true, deleted_at: Time.now) 
      
      redirect_to cpl_competition.competition_user_path(@competition, @user_competition)
    end

    def show
      @documents = @user_competition.competition_user_participations.where(partipation_type: 3, deleted: false)
    end

    private

    def set_competition_user
      @competition      = CplCompetition::Competition.find(params[:competition_id])
      @user_competition = @competition.competition_users.find_by(user_id: current_user.id)
    end

    def set_params
      params.require(:competition_user_participation).permit(:document, :competition_document_id) 
    end

  end
end