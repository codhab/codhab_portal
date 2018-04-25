class CreateSocialWorkCadastreCadastreMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :social_work_cadastre_cadastre_members do |t|
      t.string :name
      t.string :formation
      t.string :rg
      t.string :cpf
      t.string :telephone
      t.string :celphone
      t.string :activite
      t.string :registration_crea
      t.integer :cadastre_id

      t.timestamps
    end
  end
end
