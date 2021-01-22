module Candidate
  module AttendanceAppraisal
    class AppraisalDocument < ::ActiveRecord::Base

      self.table_name = 'extranet.attendance_custom_ticket_documents'

      belongs_to :document_type, class_name: '::Candidate::AttendanceAppraisal::AppraisalDocumentType'

    
    end
  end
end