module Regularization
  class MestreDarmasRegularization < ::MestreDarmasRegularization 
    
    validates :address, 
              :name, 
              :rg,
              :rg_emission_date,
              :rg_org,
              :civil_state_id,
              :nationality,
              :contact_phone,
              :contact_mobile,
              :contact_email,
              presence: true

    validates :declaration_descriptive, 
              :declaration_pacific, 
              presence: true 

    validates :income, presence: true 
    validates :cpf, cpf: true, presence: true

    validates :income_document,
              :cpf_document,
              :rg_document,
              :civil_state_document,
              :terms_use,
              presence: true
    
    validates :spouse_cpf_document,
              :spouse_rg_document,
              presence: true,
              if: -> { [2,7].include?(self.civil_state_id) }
    

    validates :declaration_spouse_pacific, presence: true, if: -> { [2,7].include?(self.civil_state_id) }
    
    validates :declaration_informal_activity_value, presence: true, if: -> { self.declaration_informal_activity }
    validates :declaration_spouse_informal_activity_value, presence: true, if: -> { self.declaration_spouse_informal_activity }
  end
end 