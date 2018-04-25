require_dependency 'social_work/application_controller'

module SocialWork
  class ExecutorCompaniesController < ApplicationController
    before_action :set_company


    def index
      @projects = Core::SocialWork::AllotmentProject.joins(allotment: :project_executes).where('social_work_project_executes.company_id = ? and social_work_allotments.status = false', @company.id)
      @situation = Core::SocialWork::AllotmentSituation.new
    end

    def create
      @situation = Core::SocialWork::AllotmentSituation.new(set_params)
      @situation.user_id = current_social_user.id
      if @situation.save
        @allotment = Core::SocialWork::Allotment.find(@situation.allotment_id)
        @allotment.update(status: true)
        redirect_to executor_company_path(@situation)
      end
    end

    def show

    end

    private

    def set_params
      params.require(:social_work_allotment_situation).permit(:agree,:observation, :allotment_id)
    end

    def set_company
      @company = Core::SocialWork::Company.find(current_social_user.company.id)
    end

  end
end
