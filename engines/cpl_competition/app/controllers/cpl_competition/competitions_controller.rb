require_dependency 'cpl_competition/application_controller'

module CplCompetition
  class CompetitionsController < ApplicationController

    before_action :authenticate!, except: [:index, :show]
    before_action :set_competition, only: [:edit, :update, :show]
    before_action :administrator_user?, except: :index, :special

    def special
      @competition = CplCompetition::Competition.find(params[:competition_id])
    end

    def index

      if current_user.nil? || !current_user.administrator?
        @competitions = CplCompetition::Competition.published
      else
        @competitions = CplCompetition::Competition.all.order(publish_at: :desc)
      end

    end

    def new
      @competition = CplCompetition::Competition.new
    end 
    
    def create
      @competition = CplCompetition::Competition.new(set_params)
      @competition.user_id = current_user.id
      
      if @competition.save
        redirect_to action: :index
      else
        render action: :new
      end
    end 
    
    def edit
    end
    
    def update
      @competition.user_id = current_user.id
      if @competition.update(set_params)
        redirect_to action: :index
      else
        render action: :new
      end
    end 

    def destroy
    end 

    private

    def set_params
      params.require(:competition)
            .permit(:title, :publish, :publish_at, 
                    :participation_started_at, :participation_ended_at, 
                    :session_started_at, :resource_started_at, :resource_ended_at, 
                    :content, :document_introduce)
    end 

    def set_competition
      @competition = CplCompetition::Competition.find(params[:id])
    end

  end
end