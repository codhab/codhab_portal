class CreateSocialWorkCadastreCadastreTitulars < ActiveRecord::Migration[5.0]
  def change
    create_table :social_work_cadastre_cadastre_titulars do |t|
      t.string :name
      t.string :formation
      t.string :rg
      t.string :cpf
      t.integer :cadastre_id

      t.timestamps
    end
  end
end
