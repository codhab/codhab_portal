require_dependency 'action/application_controller'
module Action
  class AuthorizationsController < ApplicationController

    def new
      @authorization = Action::Authorization.new
    end

    def create
      @authorization = Action::Authorization.new(set_params)

      if @authorization.valid?
        session[:action_auth_id] = @authorization.id
        session[:action_expiration_id] = Time.now + 2.hours
        redirect_to restrict_areas_path

      else
        render action: 'new'
      end
    end

    def destroy
      session[:action_auth_id] = nil
      session[:action_expiration_id] = nil

      redirect_to action_portal.new_authorization_path
    end

    private

    def set_params
      params.require(:authorization).permit(:cpf, :password)
    end

  end
end
