require_dependency 'social_work/application_controller'

module SocialWork
  class AnswersController < ApplicationController
    before_action :set_candidate

    def index
      @candidates = Core::SocialWork::Candidate.all
    end

    def new
      @questions = Core::SocialWork::Question.where(status: true, question_type: params[:type])
      @answer = @candidate.answers.new
    end

    def create
      if params[:multiple_ids].length > 0
        @multiple = Core::SocialWork::QuestionMultiple.find(params[:multiple_ids])
        @multiple.each do |m|
          @answer = @candidate.answers.new(
            question_multiple_id: m.id,
          )
          @answer.save
        end
        @step = Core::SocialWork::StepService.new
        if params[:social_work_answer][:answer].present?
          @answer = @candidate.answers.new(
            answer: params[:social_work_answer][:answer]
          )
          @answer.save
        end
        if params[:social_work_answer][:type] == "0"
          @step.create_step!(5,@candidate.candidate_projects.last.id, "Situação Habitacional.")
        else
          @step.create_step!(6,@candidate.candidate_projects.last.id, "Infra. Residêncial.")
        end
        redirect_to candidate_path(@candidate)
      else
        render action: 'new'
      end
    end

    def destroy
      @candidate.destroy
      flash[:success] =  t :success
      render action: :index
    end

    private

    def set_params
      params.require(:social_work_answer).permit(:question_id, :answer)
    end

    def set_candidate
      @candidate = Core::SocialWork::Candidate.find(params[:candidate_id])
    end

  end
end
