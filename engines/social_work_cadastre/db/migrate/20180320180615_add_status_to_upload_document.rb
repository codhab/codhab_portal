class AddStatusToUploadDocument < ActiveRecord::Migration[5.0]
  def change
    add_column :social_work_cadastre_upload_documents, :status, :boolean, default: true
  end
end
