class CreateMestreDarmasRegularizations < ActiveRecord::Migration[5.0]
  def change
    create_table 'offboardx.form_mestre_darmas_regularizations' do |t|

      t.integer :unit_id
      t.string :address
      t.string  :name
      t.string  :nationality
      t.integer :civil_state_id
      t.string  :civil_state_document
      t.string  :rg
      t.date    :rg_emission_date
      t.string  :rg_org
      t.string  :rg_document
      t.string  :cpf
      t.string  :cpf_document
      t.decimal :income, precision: 8, scale: 2
      t.string  :income_document
      
      t.string  :spouse_name
      t.string  :spouse_rg
      t.date    :spouse_rg_emission_date
      t.string  :spouse_rg_org
      t.string  :spouse_rg_document
      t.string  :spouse_cpf
      t.string  :spouse_cpf_document

      t.string  :contact_phone
      t.string  :contact_mobile
      t.string  :contact_email

      t.string  :document_address
      t.string  :document_iptu
      t.string  :document_onus
      t.string  :terms_use, default: false

      t.decimal  :declaration_informal_activity_value, precision: 8, scale: 2

      t.boolean  :declaration_informal_activity, default: false
      t.boolean  :declaration_descriptive, default: false
      t.boolean  :declaration_pacific, default: false
      t.boolean  :declaration_spouse_pacific, default: false

      t.boolean  :declaration_stable_union, default: false
      t.boolean  :declaration_spouse_informal_activity, default: false
      t.decimal  :declaration_spouse_informal_activity_value, precision: 8, scale: 2

      t.timestamps
    end
  end
end
