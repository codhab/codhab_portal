module CplCompetition
  class CompetitionChatsController < ApplicationController
    before_action :set_competition

    def create
      @chat = @competition.competition_chats.new(set_params)
      @chat.user_id = current_user.id
      @chat.save
    end

    private

    def set_params
      params.require(:competition_chat).permit(:content)
    end

    def set_competition
      @competition      = CplCompetition::Competition.find(params[:competition_id])
    end
  end
end