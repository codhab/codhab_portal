class CreateFormItapoaRegularizations < ActiveRecord::Migration[5.0]
  def change
    create_table 'algox.form_itapoa_regularizations' do |t|

      t.integer :category_id
      t.integer :city_id
      t.integer :unit_id
      t.string  :cep
      t.string  :complete_address
      t.string  :cpf, null: false
      t.string  :name
      t.string  :rg
      t.string  :naturality
      t.integer :civil_state_id
      t.string  :income
      t.string  :habitation_type_id
      t.string  :spouse_name
      t.string  :spouse_rg
      t.string  :spouse_cpf
      t.string  :spouse_job
      t.string  :spouse_income
      t.string  :phone
      t.string  :email
      t.string  :document_rg
      t.string  :document_cpf
      t.string  :document_civil_state
      t.string  :document_income
      t.string  :document_spouse_income
      t.string  :document_spouse_rg
      t.string  :document_spouse_cpf
      t.string  :document_occupation_time
      t.string  :photo_unit_one
      t.string  :photo_unit_two
      t.string  :photo_unit_three
      t.string  :photo_unit_front
      t.string  :photo_unit_inside_one
      t.string  :photo_unit_inside_two
      t.string  :document_address
      t.string  :document_iptu
      t.string  :document_onus
      t.string  :declaration_occupation
      t.string  :declaration_occupation_one
      t.string  :declaration_occupation_two
      t.string  :declaration_negative
      t.string  :declaration_descriptive
      t.string  :declaration_pacific
      t.string  :declaration_informal_activity
      t.string  :declaration_informal_activity_value
      t.string  :declaration_stable_union
      t.string  :declaration_spouse_pacific
      t.string  :declaration_spouse_informal_activity
      t.string  :declaration_spouse_informal_activity_value
      t.string  :declaration_unit_area
      t.string   :password_digest
      t.string   :remember_token
      t.datetime :remember_token_expires_at

      t.integer :situation_id
      
      t.timestamps
    end
  end
end
