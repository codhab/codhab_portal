require_dependency 'concourse/application_controller'
module Concourse
  class ProjectsController < ApplicationController
    layout 'layouts/concourse/application', except: [:index]

    def index
      @projects = Concourse::Project.all

      render layout: 'application'
    end

    def show
      @project = Concourse::Project.friendly.find(params[:id])
      @current_nav = "home"
    end

    def result
    end

    def all_projects
    end

  end
end
