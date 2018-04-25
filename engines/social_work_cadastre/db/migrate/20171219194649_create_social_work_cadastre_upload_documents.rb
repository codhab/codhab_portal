class CreateSocialWorkCadastreUploadDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :social_work_cadastre_upload_documents do |t|

      t.integer :document_type_id
      t.integer :cadastre_id
      t.text :observation
      t.string :file_path

      t.timestamps
    end
  end
end
