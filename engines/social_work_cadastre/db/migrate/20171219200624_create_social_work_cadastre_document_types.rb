class CreateSocialWorkCadastreDocumentTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :social_work_cadastre_document_types do |t|

      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
