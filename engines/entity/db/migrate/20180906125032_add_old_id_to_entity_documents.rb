class AddOldIdToEntityDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :entity_documents, :old_id, :integer
  end
end
