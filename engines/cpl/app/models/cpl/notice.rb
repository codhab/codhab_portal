module Cpl
  class Notice < ActiveRecord::Base # :nodoc:
    self.table_name = 'generic.cpl_notices'

    has_many :documents, class_name: '::Cpl::NoticeDocument'

    mount_uploader :attachment, ::Cpl::AttachmentUploader
  end
end
