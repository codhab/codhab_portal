require_dependency 'social_work/application_controller'

module SocialWork
  class DependentsController < ApplicationController
    before_action :set_candidate
    before_action :set_dependent, only: [:show, :update, :edit, :destroy]


    def index
      @dependents = Core::SocialWork::Dependent.all
    end

    def new
      @dependent = @candidate.dependents.new
    end


    def finalize_dependent
      @step = Core::SocialWork::StepService.new
      @step.create_step!(4,@candidate.candidate_projects.last.id, "Atualização de dependentes.")
      redirect_to candidate_path(@candidate)
    end

    def create
      @dependent = @candidate.dependents.new(set_params)

      if @dependent.save
        @step = Core::SocialWork::StepService.new
        @step.create_step!(4,@candidate.candidate_projects.last.id, "Atualização de dependentes.")
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
      redirect_to action: :index
    end

    private

    def set_candidate
      @candidate = Core::SocialWork::Candidate.find(params[:candidate_id])
    end

    def set_params
      params.require(:social_work_dependent).permit(:name,:cpf,:father_name,:mother_name,:rg,:rg_org,:work_ocupation,
                                                    :rg_date,:born,:technical_course_interest,:technical_course_name,:income,
                                                    :candidate_id,:kinship_id,:gender_id,:state_civil_id,:education_id)
    end

    def set_dependent
      @dependent = @candidate.dependents.find(params[:id])
    end

  end
end
