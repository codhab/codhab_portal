require_dependency 'social_work/application_controller'

module SocialWork
  class CandidatesController < ApplicationController
    before_action :set_candidate, only: [:show, :update, :edit, :destroy]


    def index
      @candidates = Core::SocialWork::Candidate.all
    end

    def new
      @candidate = Core::SocialWork::Candidate.new
    end

    def create
      @candidate = Core::SocialWork::Candidate.new(set_params)

      if @candidate.save
        @service = Core::SocialWork::CandidateService.new(@candidate)
        @service.create_project!

        @step = Core::SocialWork::StepService.new
        @step.create_step!(2,@candidate.candidate_projects.last.id, "Perfil socio econômico")

        unless [2,7].include? @candidate.civil_state_id.to_i
          @step.create_step!(3,@candidate.candidate_projects.last.id, "Não possue cônjuge/companheiro(a)")
        end

        redirect_to candidate_path(@candidate)
      else
        render action: 'new'
      end
    end

    def update
      if @candidate.update(set_params)
        @step = Core::SocialWork::StepService.new
        unless [2,7].include? @candidate.civil_state_id.to_i
          @step.create_step!(3,@candidate.candidate_projects.last.id, "Não possue cônjuge/companheiro(a)")
        end
        redirect_to candidate_path(@candidate)
      else
        render action: 'edit'
      end
    end

    def show
      @dependents = @candidate.dependents
      @answers = @candidate.answers
      @steps = @candidate.candidate_projects.last.step_projects
      @documents = @candidate.document_uploads
      @interactions = @candidate.project_interactions
    end

    def destroy
      @candidate.destroy
      flash[:success] =  t :success
      redirect_to action: 'index'
    end

    def burgh
      city = params[:city_id]
      render json: @burgh = Core::Address::Burgh.where(city_id: city)
    end

    private
    def set_params
      params.require(:social_work_candidate).permit(:name,:cpf,:rg,:rg_org, :born,:rg_date,:father_name,:mother_name,:place_birth, :burgh_id,
                                                    :technical_course_interest,:technical_course_name,:address,:complement_address,:email,
                                                    :telephone,:celphone,:work,:work_ocupation,:work_phone,:income,:pension_flag,:benefit_flag, :nis,
                                                    :family_special,:gender,:city_id,:civil_state_id,:education_id,:pension_id,:benefit_id)
    end

    def set_candidate
      @candidate = Core::SocialWork::Candidate.find(params[:id])
    end
  end
end
