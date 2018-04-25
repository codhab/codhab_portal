class AddOrderToDocumentType < ActiveRecord::Migration[5.0]
  def change
    add_column :social_work_cadastre_document_types, :order, :integer
  end
end
