require_dependency 'concourse/application_controller'

module Concourse
  module SubscribeCandidate
    class PasswordsController < ApplicationController
      before_action :set_token, except: [:success]

      def edit
        @candidate = Concourse::Password.find(@token.candidate_id)
      end

      def update
        @candidate = Concourse::Password.find(@token.candidate_id)
        if @candidate.update(set_params)
          @token.status = false
          @token.save

          flash[:success] = t :success
          redirect_to action: 'success'
        else
          render action: :edit
        end
      end

      def success
      end

      private

      def set_token
        @token     = Concourse::CandidateToken.where(status: true).find_by_secret_key(params[:id]) rescue nil

        redirect_to '/404' if @token.nil?
      end

      def set_params
        params.require(:password).permit(:password, :confirmation_password, :token)
      end
    end
  end
end
