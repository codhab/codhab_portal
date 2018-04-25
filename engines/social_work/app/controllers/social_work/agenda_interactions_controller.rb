require_dependency 'social_work/application_controller'

module SocialWork
  class AgendaInteractionsController < ApplicationController
    before_action :set_schedule

    def new
      @interaction = @schedule.schedule_interactions.new
    end

    def create
      @interaction = @schedule.schedule_interactions.new(set_params)

      if @interaction.save
        redirect_to candidate_schedules_path
      else
        render action: 'new'
      end
    end

    private

    def set_schedule
      @schedule = Core::SocialWork::CandidateSchedule.find(params[:candidate_schedule_id])
    end

    def set_params
      params.require(:social_work_schedule_interaction).permit(:description)
    end

  end
end
