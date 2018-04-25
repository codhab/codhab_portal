require_dependency 'concourse/application_controller'
module Concourse
  class PagesController < ApplicationController
    before_action :set_project
    layout 'layouts/concourse/application'

    def index
    end

    def show
      @page = Concourse::Page.friendly.find(params[:id])
    end

    private

    def set_project
      @project = Concourse::Project.friendly.find(params[:project_id])
    end

  end
end
