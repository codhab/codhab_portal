require_dependency 'firm/application_controller'

module SocialWork
  class AuthorizationController < ApplicationController
    layout 'application'

    def new
      @authorization = SocialWork::Authorization.new
    end

    def create
      @authorization = SocialWork::Authorization.new(set_params)

      if @authorization.valid?
        session[:user_auth_id] = @authorization.id
        session[:user_expiration_id] = Time.now + 2.hours
        if @authorization.company_type == 'Empresa de Projetos'
          redirect_to candidate_schedules_path
        else
          redirect_to executor_companies_path
        end
      else
        render action: 'new'
      end
    end

    def destroy
      session[:user_auth_id] = nil
      session[:user_expiration_id] = nil

      redirect_to social_work.new_authorization_path

    end

    private

    def set_params
      params.require(:authorization).permit(:username, :password)
    end

  end
end
