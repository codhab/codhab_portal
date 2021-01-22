require_dependency 'candidate/application_controller'

module Candidate
  module AttendanceAppraisal
    class DocumentsController < ApplicationController
      
      def index
        @ticket = ::Candidate::AttendanceAppraisal::Appraisal.find_by(id: params[:appraisal_id])
      end

      def check
        @ticket = ::Candidate::AttendanceAppraisal::Appraisal.find_by(id: params[:appraisal_id])
        @document = ::Candidate::AttendanceAppraisal::AppraisalDocument.where(custom_ticket_id: @ticket.id).find(params[:document_id])

        @document.update(medical_validate: !@document.medical_validate)
      end

    end
  end
end