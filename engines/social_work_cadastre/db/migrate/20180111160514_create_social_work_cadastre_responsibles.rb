class CreateSocialWorkCadastreResponsibles < ActiveRecord::Migration[5.0]
  def change
    create_table :social_work_cadastre_responsibles do |t|
      t.integer :members_id
      t.integer :cadastre_id
      t.boolean :responsible

      t.timestamps
    end
  end
end
