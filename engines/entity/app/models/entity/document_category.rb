module Entity
  class DocumentCategory < ActiveRecord::Base
    self.table_name = 'extranet.entity_document_categories'

    has_many :documents
  end
end