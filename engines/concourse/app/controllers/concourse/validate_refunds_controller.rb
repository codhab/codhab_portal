require_dependency 'concourse/application_controller'

module Concourse
  class ValidateRefundsController < ApplicationController
    before_action :set_project

    def new
      @refund = Concourse::RefundValidate.new
    end

    def create
      @refund = Concourse::RefundValidate.new(set_params)
      if @refund.valid?        
        session[:candidate_id] = @refund.candidate_id
        redirect_to new_project_refund_path(@project)
      else
        render action: :new
      end
    end

    private

    def set_params
      params.require(:refund_validate).permit(:candidate_id, :password)
    end

    def set_project
      @project = Concourse::Project.friendly.find(params[:project_id])
    end
  end
end
