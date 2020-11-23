require_dependency 'candidate/application_controller'

module Candidate
  module AttendanceAppraisal
    class DocumentsController < ApplicationController
      
      def index
        @ticket = ::Candidate::AttendanceAppraisal::Appraisal.find(params[:id])
      end

    end
  end
end