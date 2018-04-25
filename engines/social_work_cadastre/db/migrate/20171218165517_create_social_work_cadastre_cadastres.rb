class CreateSocialWorkCadastreCadastres < ActiveRecord::Migration[5.0]
  def change
    create_table :social_work_cadastre_cadastres do |t|
      t.string :social_reason
      t.string :crea
      t.string :cnpj
      t.string :password
      t.string :address
      t.string :cep
      t.string :uf
      t.string :telephone
      t.string :celphone
      t.string :email
      t.integer :city_id
      t.string :district
      t.boolean :technological_resources
      t.boolean :declaration_1
      t.boolean :declaration_2
      t.boolean :declaration_3
      t.boolean :declaration_4
      t.boolean :sicaf
      t.integer :situation


      t.timestamps
    end
  end
end
