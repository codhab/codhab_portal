module Entity
  class Document < ActiveRecord::Base
    self.table_name = 'extranet.entity_documents'

    belongs_to :old, foreign_key: :old_id
    belongs_to :document_category

    validates :archive_path, file_size: { less_than_or_equal_to: 100.megabytes.to_i,
      message: "Arquivo não pode exceder 100 MB" }

    mount_uploader :archive_path, Wiki::FileUploader
  end
end