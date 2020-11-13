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
      
      def check
        @candidate = ::Candidate::ExternalAttendance::Candidate.find_by(cadastre_id: params[:candidate_id])
        
        @candidate_enterprise = ::Firm::EnterpriseCadastre.where(enterprise_id: 212, indication_type_id: 999).find_by(cadastre_id: @candidate.cadastre_id) 
        
        if @candidate_enterprise.nil?
          @candidate_enterprise = ::Firm::EnterpriseCadastre.where(indication_type_id: 999, enterprise_id: 212).new(cadastre_id: @candidate.cadastre_id)
          @candidate_enterprise.save(validate: false)
        else
          @candidate_enterprise.destroy
        end

        redirect_to candidate.external_attendance_candidates_path(by_cpf: @candidate.cpf, page: params[:page])
      end

    end
  end
end