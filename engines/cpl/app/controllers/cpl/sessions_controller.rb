require_dependency 'cpl/application_controller'

module Cpl
  class SessionsController < ApplicationController # :nodoc:
    def new
      @session = Cpl::Session.new
    end

    def create
      @session = Cpl::Session.new(set_params)
      if @session.valid?
        session[:user_id] = @session.id
        redirect_to notices_path
      else
        render action: 'new'
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to new_session_path
    end

    private

    def set_params
      params.require(:session).permit(:login, :password)
    end
  end
end
