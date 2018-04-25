class AddSicafToDocumentType < ActiveRecord::Migration[5.0]
  def change
    add_column :social_work_cadastre_document_types, :sicaf, :boolean
  end
end
