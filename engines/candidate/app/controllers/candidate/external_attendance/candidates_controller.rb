require_dependency 'candidate/application_controller'

module Candidate
  module ExternalAttendance
    class CandidatesController < ApplicationController
      before_action :authenticate_external_attendance!
      has_scope :by_cpf
      
      def index
        @candidates = apply_scopes(::Candidate::ExternalAttendance::Candidate).all.paginate(page: params[:page], per_page: 50)
      end
      
      def show
        @candidate = ::Candidate::Cadastre.find_by(cpf: params[:id])
        @candidate.update(special_token: Digest::SHA1.hexdigest([Time.now, rand].join))
      end

    end
  end
end