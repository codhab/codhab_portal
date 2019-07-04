require_dependency 'cpl_competition/application_controller'

module CplCompetition
  class CompetitionsController < ApplicationController

    def index

      if current_user.nil? || !current_user.administrator?
        @competitions = CplCompetition::Competition.published
      else
        @competitions = CplCompetition::Competition.all.order(published_at: :desc)
      end

    end

    def new
    end 

    def create
    end 

    def edit
    end

    def update
    end 

    def destroy
    end 

    private

    def set_params
    end 

    def set_competition
    end

  end
end