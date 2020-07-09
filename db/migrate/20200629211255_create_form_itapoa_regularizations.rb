class CreateFormItapoaRegularizations < ActiveRecord::Migration[5.0]
  def change
    create_table 'offboardx.form_itapoa_regularizations' do |t|
      
      t.integer  :category_id, default: 1
      t.integer  :unit_id
      t.string   :iptu_code, null: false
      t.integer  :situation_id, default: 1
      t.text     :staff_observation
      t.datetime :staff_observation_read_at
      
      t.boolean  :no_iptu_code, default: false
      t.integer  :complete_address
      
      t.string  :cpf, null: false
      t.date    :born, null: false
      
      t.string  :name
      t.string  :rg
      t.string  :naturality
      t.integer :civil_state_id
      t.decimal :income, precision: 8, scale: 2
      t.string  :habitation_type_id
      t.string  :spouse_name
      t.string  :spouse_rg
      t.string  :spouse_cpf
      t.date    :spouse_born
      t.string  :spouse_job
      t.decimal :spouse_income, precision: 8, scale: 2
      t.string  :phone
      t.string  :email
      
      # Vazio/Construído/Em construção;
      t.integer :unit_characterist

      # Doado pelo GDF/Irregular/Alugado/Cedido/Comprado;
      t.integer :unit_characterist_occupation

      # Alvenaria/Madeira/Madeirite/Outros;
      t.integer :unit_characterist_edification

      # 01 a 03/04 a 05/Mais de 05;
      t.integer :unit_characterist_room
      
      # 01 a 03/04 a 07/Mais de 07;
      t.integer :unit_characterist_dweller
      
      # CAESB/Gambiarra/Sem água;
      t.integer :unit_characterist_piped_water
      
      # CEB/Gambiarra/Sem energia.  
      t.integer :unit_characterist_electricity

      t.string   :document_rg
      t.string   :document_cpf
      t.string   :document_civil_state
      t.string   :document_income
      t.string   :document_spouse_income
      t.string   :document_spouse_rg
      t.string   :document_spouse_cpf
      t.string   :document_occupation_time
      t.string   :photo_unit_front
      t.string   :photo_unit_inside_one
      t.string   :photo_unit_inside_two
      t.string   :document_address
      t.string   :document_iptu
      t.string   :document_onus
      
      t.boolean  :declaration_occupation, default: false
      t.boolean  :declaration_occupation_one, default: false
      t.boolean  :declaration_occupation_two, default: false
      t.boolean  :declaration_negative, default: false
      t.boolean  :declaration_descriptive, default: false
      t.boolean  :declaration_pacific, default: false
      t.boolean  :declaration_informal_activity, default: false
      t.decimal  :declaration_informal_activity_value, precision: 8, scale: 2
      t.boolean  :declaration_negative_stable_union, default: false
      t.boolean  :declaration_stable_union, default: false
      t.boolean  :declaration_spouse_pacific, default: false
      t.boolean  :declaration_spouse_informal_activity, default: false
      t.decimal  :declaration_spouse_informal_activity_value, precision: 8, scale: 2
      
      t.string   :declaration_unit_area
      t.boolean  :terms_use, default: false
      

      
      t.timestamps
    end
  end
end
