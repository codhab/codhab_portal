
module Concourse
  class ApplicationController < ActionController::Base
    before_action :set_project
    before_action :set_candidate

    layout 'concourse/application'
    helper 'application'
    
    private

    def set_candidate
      if session[:candidate_id].present? && @project.present?
        @candidate = Concourse::Candidate.find(session[:candidate_id])

        unless @candidate.subscribe.project_id == @project.id
          @candidate = nil
          session[:candidate_id] = nil
        end
      end
    end

    def set_project
      if params[:project_id].present?
        @project = Concourse::Project.friendly.find(params[:project_id]) rescue nil
      end
    end
  end
end
