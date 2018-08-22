module Cpl
  class DocumentParticipant < ActiveRecord::Base # :nodoc:
    self.table_name = 'generic.cpl_document_participants'

    belongs_to :notice_participant

    mount_uploader :attachment, ::Cpl::AttachmentUploader
  end
end
