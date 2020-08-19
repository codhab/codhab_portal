require_dependency 'candidate/application_controller'

module Candidate
  module ExternalAttendance
    class CandidatesController < ApplicationController
      #before_action :set_authenticate_external_attendance
      has_scope :by_cpf
      
      def index
        @candidates = apply_scopes(::Candidate::ExternalAttendance::Candidate).all.limit(10)
      end
      
      def show
        @candidate = ::Candidate::ExternalAttendance::Candidate.find_by(cpf: params[:id])
      end

    end
  end
end