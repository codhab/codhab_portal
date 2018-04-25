require_dependency 'firm/application_controller'

module Concourse
  class AuthorizationController < ApplicationController
    layout 'application'

    def new
      @authorization = Concourse::Authorization.new
    end

    def create
      @authorization = Concourse::Authorization.new(set_params)
      if @authorization.valid?
        session[:user_auth_id] = @authorization.id
        session[:user_expiration_id] = Time.now + 2.hours

        redirect_to external_consults_path
      else
        render action: 'new'
      end
    end

    def destroy
      session[:user_auth_id] = nil
      session[:user_expiration_id] = nil
      redirect_to concourse.new_authorization_path
    end

    private

    def set_params
      params.require(:authorization).permit(:email, :password)
    end

  end
end
