class CreateSocialWorkCadastreCadastreSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :social_work_cadastre_cadastre_steps do |t|
      t.references :cadastre, index: true
      t.integer :step

      t.timestamps
    end
  end
end
