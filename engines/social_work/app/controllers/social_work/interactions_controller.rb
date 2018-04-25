require_dependency 'social_work/application_controller'

module SocialWork
  class InteractionsController < ApplicationController
    before_action :set_candidate

    def new
      @interaction = @candidate.project_interactions.new
      case params[:type]
      when "1"
        @title = 'Requisitos Sociais'
      when "2"
        @title = 'Visita Técnica'
      when "3"
        @title = 'Requisitos técnicos'
      when "4"
        @title = 'Estudo Preliminar'
      when "5"
        @title = 'Aprovação do Morador'
      when "6"
        @title = 'Projeto Executivo'
      when "7"
        @title = 'Visita Social'
      end
    end

    def create
      @interaction = @candidate.project_interactions.new(set_params)

      case @interaction.type
      when "1"
        title = 'Requisitos Sociais'
        step = 8
      when "2"
        title = 'Visita Técnica'
        step = 9
      when "3"
        title = 'Requisitos técnicos'
        step = 10
      when "4"
        title = 'Estudo Preliminar'
        step = 12
      when "5"
        title = 'Aprovação do Morador'
        step = 13
      when "6"
        title = 'Projeto Executivo'
        step = 14
      when "7"
        title = 'Visita Social'
        step = 1
      end
      @interaction.title = title
      @interaction.candidate_project_id = @candidate.candidate_projects.last.id
      if @interaction.save
        @step = Core::SocialWork::StepService.new

        if step == 10 && @interaction.positive == true
          @step.create_step!(10,@candidate.candidate_projects.last.id, title)
          @step.create_step!(11,@candidate.candidate_projects.last.id, "Habilitado")
        elsif step > 10 && @interaction.positive == true
          @step.create_step!(step,@candidate.candidate_projects.last.id, title)
        else
          @step.create_step!(step,@candidate.candidate_projects.last.id, title)
        end
        redirect_to candidate_path(@candidate)
      else
        render action: 'new'
      end
    end

    private

    def set_candidate
      @candidate = Core::SocialWork::Candidate.find(params[:candidate_id])
    end

    def set_params
      params.require(:social_work_project_interaction).permit(:document_one,:document_two,:description,:date,:hour,:positive, :type)
    end



  end
end
