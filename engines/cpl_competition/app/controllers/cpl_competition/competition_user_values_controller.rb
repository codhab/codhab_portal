module CplCompetition
  class CompetitionUserValuesController < ApplicationController
    before_action :set_competition
    before_action :administrator_user?
    
    def edit
      @user_competition_value = CplCompetition::CompetitionUserValue.new
      @user_competition_value.competition_user_id = @user_competition.id
    end 
    
    def update
      @user_competition_value = CplCompetition::CompetitionUserValue.new(set_params)
      @user_competition_value.competition_user_id = @user_competition.id
      @user_competition_value.save
    end 

    private

    def set_params
    end

    def set_competition
      @competition = CplCompetition::Competition.find(params[:competition_id])
      @user_competition = @competition.competition_users.find_by(user_id: current_user.id)
    end
    
    def set_params
      params.require(:x).permit(:value)
    end
  end
end