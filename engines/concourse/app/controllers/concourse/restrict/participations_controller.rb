require 'concourse/application_controller'

module Concourse
  module Restrict
    class ParticipationsController < ApplicationController
      before_action :set_project
      before_action :set_candidate

      def index
      end

      def new
        @participation = @candidate.candidate_participation.where(group_participation: params[:group]).new
      end


      def show
        @participation = @candidate.candidate_participation.find(params[:id])
      end

      def create

        unless @project.start_participation <= Date.current && @project.end_participation >= Date.current
          return redirect_to action: :index
        end

        @participation = @candidate.candidate_participation.new(set_params)

        if @participation.save
          Concourse::SubscribeMailer.project_send(@candidate.email,@candidate.id,@candidate.subscribe.project_id).deliver_now
          flash[:success] =  "Projeto enviado com sucesso!"
          redirect_to action: :index
        else
          render action: :new
        end
      end

      def destroy

        unless @project.start_participation <= Date.current && @project.end_participation >= Date.current
          return redirect_to action: :index
        end

        @participation = @candidate.candidate_participation.find(params[:id])
        @participation.destroy
        flash[:success] =  "Projeto cancelado com sucesso!"
        redirect_to project_restrict_candidates_path(project_id: @project)
      end

      private

      def set_project
        @project = Concourse::Project.friendly.find(params[:project_id])
      end

      def set_params
        params.fetch(:candidate_participation, {}).permit(:archive_one, :archive_two, :archive_three, :archive_four, :archive_five,
                                                          :group_participation, team_participations_attributes: [:id, :_destroy, :name, :observation, :job])
      end

      def set_candidate
        @candidate = Concourse::Candidate.find(session[:candidate_id])
      end
    end
  end
end
