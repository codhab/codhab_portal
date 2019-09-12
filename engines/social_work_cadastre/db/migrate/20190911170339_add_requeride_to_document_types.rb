class AddRequerideToDocumentTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :social_work_cadastre_document_types, :required, :boolean
  end
end