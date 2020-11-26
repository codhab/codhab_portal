module Regularization
  class MestreDarmasRegularizationCadastresController < ApplicationController
    before_action :mestre_darmas_user_authenticate!
    helper_method :mestre_darmas_current_user
    def index
      @solicitations = ::Regularization::MestreDarmasRegularization.all.order(created_at: :asc)
    end 
    
    def show
      @solicitation = ::Regularization::MestreDarmasRegularization.find(params[:id])
    end


    
    private

    def mestre_darmas_user_authenticate!
      if mestre_darmas_current_user.nil?
        redirect_to regularization.mestre_darmas_regularization_sessions_path if controller_name != 'mestre_darmas_sessions'
      end  
    end

    def mestre_darmas_current_user 
      ::Candidate::ExternalAttendance::User.find_by(id: session[:mestre_darmas_user_id])
    end

  end
end
