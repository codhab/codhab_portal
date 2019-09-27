class AddConfimationRequerideToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :social_work_cadastre_upload_documents, :confirmation, :boolean, default: false
  end
end
