module Cpl
  class NoticeDocument < ActiveRecord::Base # :nodoc:
    self.table_name = 'generic.cpl_notice_documents'

    belongs_to :document_type
  end
end
