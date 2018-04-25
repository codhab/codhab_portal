require_dependency 'firm/application_controller'

module Concourse
  class ExternalConsultsController < ApplicationController
    layout 'application'

    has_scope :by_date
    has_scope :by_responded

    def index
      if session[:user_auth_id].present?
        @user = Concourse::UserProject.find(session[:user_auth_id])
        @consults = apply_scopes(Concourse::Consult.where(project_id: @user.project_id)).paginate(:page => params[:page], :per_page => 40)
      else
        flash[:warning] = "Usuário não logado."
        redirect_to new_authorization_path
      end
    end

    def show
      @consult = Concourse::Consult.find(params[:id])
    end
  end
end
