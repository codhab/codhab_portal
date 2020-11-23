require_dependency 'candidate/application_controller'

module Candidate
  module AttendanceAppraisal
    class AppraisalsController < ApplicationController
      
      def index
        #@@apprailsas = apply_scopes(Candidate::AttendanceAppraisal::Appraisal).all.order(id: :desc).paginate(page: params[:page], per_page: 50)
      end

    end
  end
end