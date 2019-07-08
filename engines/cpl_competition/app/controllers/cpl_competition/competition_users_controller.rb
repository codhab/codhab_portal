module CplCompetition
  class CompetitionUsersController < ApplicationController
    before_action :set_competition

    def new
      @user_competition = current_user.competition_users.new
      @user_competition.competition_id = @competition.id

      if @user_competition.save
        redirect_to cpl_competition.competition_user_path(@competition, @user_competition)
      else
        flash[:notice] = "Você já está participando deste edital!"
        redirect_to cpl_competition.competitions_path
      end
    end 

    def show
      @user_competition = current_user.competition_users.find_by(competition_id: @competition)
      @document   = @user_competition.competition_user_participations.where(partipation_type: 0).new
      @proposal   = @user_competition.competition_user_participations.where(partipation_type: 1).new
      @credential = @user_competition.competition_user_credentials.new 
    end
    
    def edit
      @user_competition = @competition.competition_users.find_by(id: params[:id])
    end
    
    def update
      @user_competition = @competition.competition_users.find_by(id: params[:id])
      @user_competition.update(set_params)

      event = @competition.competition_events.new(
        description: "Usuário #{current_user.name.upcase} atualizou o valor de proposta da empresa #{@user_competition.user.name.upcase}",
        user_id: current_user.id,
        event_type: 'evento'
      )
      event.save
    end

    private

    def set_params
      params.require(:competition_user).permit(:value)
    end

    def set_competition
      @competition = CplCompetition::Competition.find(params[:competition_id])
    end

  end
end