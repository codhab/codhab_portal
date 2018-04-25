require_dependency 'concourse/application_controller'

module Concourse
  module SubscribeCandidate
    class RemembersController < ApplicationController

      def index
        @candidate = Concourse::Candidate.where(cpf: params[:cpf])
      end

      def token
        @candidate = Concourse::Candidate.find(params[:remember_id])

        if @candidate.present?
          token = Concourse::CandidateToken.new(candidate_id: @candidate.id, status: true)
          token.save

          Concourse::SubscribeMailer::remember_password(@candidate.email, @candidate, @candidate.subscribe.project, token.secret_key).deliver_now!
        else
          redirect_to action: 'remember_password'
        end
      end

      def edit_password
      end

      def update_password
      end
    end
  end
end
