require_dependency 'social_work/application_controller'

module SocialWork
  class SpousesController < ApplicationController
    before_action :set_candidate
    before_action :set_spouse, only: [:show, :update, :edit, :destroy]

    def new
      @dependent = @candidate.dependents.new
    end

    def create
      @dependent = @candidate.dependents.new(set_params)
      if @dependent.save
        @step = Core::SocialWork::StepService.new
        @step.create_step!(3,@candidate.candidate_projects.last.id, "Inclusão de cônjuge.")
        redirect_to candidate_path(@candidate)
      else
        render action: 'new'
      end
    end

    def update
      if @dependent.update(set_params)
        flash[:success] = t :success
        redirect_to candidate_path(@candidate)
      else
        render action: 'edit'
      end
    end

    def destroy
      @dependent.destroy
      flash[:success] =  t :success
      redirect_to candidate_path(@candidate)
    end

    private

    def set_candidate
      @candidate = Core::SocialWork::Candidate.find(params[:candidate_id])
    end
    def set_params
      params.require(:social_work_dependent).permit(:name,:cpf,:father_name,:mother_name,:rg,:rg_org,:work_ocupation,
                                                    :rg_date,:born,:technical_course_interest,:technical_course_name,:income,
                                                    :candidate_id,:kinship_id,:gender_id,:civil_state_id,:education_id)
    end

    def set_spouse
      @dependent = @candidate.dependents.find(params[:id])
    end

  end
end
