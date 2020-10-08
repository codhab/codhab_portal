require_dependency 'candidate/application_controller'

module Candidate
  module ExternalAttendance
    class CandidatesController < ApplicationController
      before_action :authenticate_external_attendance!
      has_scope :by_cpf
      has_scope :by_indication
      has_scope :by_occurrence
      
      def index
        @candidates = apply_scopes(::Candidate::ExternalAttendance::Candidate).all.paginate(page: params[:page], per_page: 50)
      end
      
      def show
        @candidate = ::Candidate::ExternalAttendance::Candidate.find_by(cpf: params[:id])
        
        if @candidate.nil?
          redirect_to action: :index
        else
          @candidate = @candidate.cadastre
          @candidate.update(special_token: Digest::SHA1.hexdigest([Time.now, rand].join))
        end
      end

      def occurrence
        @candidate = ::Candidate::ExternalAttendance::Candidate.find_by(cadastre_id: params[:candidate_id])
      end
      
      def ticket_request
        @candidate = ::Candidate::ExternalAttendance::Candidate.find_by(cadastre_id: params[:candidate_id])
      end

    end
  end
end