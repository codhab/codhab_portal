module Regularization
  class MestreDarmasRegularizationSessionsController < ApplicationController
  
    def index
      redirect_to action: :new
    end

    def new
      @mestre_darmas_regularization_session = ::Regularization::MestreDarmasRegularizationSession.new
    end
    
    def create
      @mestre_darmas_regularization_session = ::Regularization::MestreDarmasRegularizationSession.new(set_params)
      
      if @mestre_darmas_regularization_session.authenticate(session)
        redirect_to regularization.mestre_darmas_regularization_cadastres_path
      else
        render action: :new
      end
    end

    def destroy
      session[:mestre_darmas_user_id] = nil

      redirect_to regularization.mestre_darmas_regularization_sessions_path
    end

    private

    def set_params
      params.require(:mestre_darmas_regularization_session).permit(:username,:password)
    end

  end
end

