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

    #validates_uniqueness_of :cpf, message: "CPF já realizou um requerimento"

    validates :income_document,
              :cpf_document,
              :rg_document,
              :civil_state_document,
              :terms_use,
              presence: true
    
    validates :spouse_name,
              :spouse_cpf,
              :spouse_rg,
              :spouse_rg_emission_date,
              :spouse_rg_org,
              :spouse_cpf_document,
              :spouse_rg_document,
              presence: true,
              if: -> { [2,7].include?(self.civil_state_id) }
    

    validates :declaration_spouse_pacific, presence: true, if: -> { [2,7].include?(self.civil_state_id) }
    
    validates :declaration_informal_activity_value, presence: true, if: -> { self.declaration_informal_activity }
    validates :declaration_spouse_informal_activity_value, presence: true, if: -> { self.declaration_spouse_informal_activity }

    mount_uploader :spouse_cpf_document, Regularization::DocumentUploader
    mount_uploader :spouse_rg_document, Regularization::DocumentUploader
    mount_uploader :income_document, Regularization::DocumentUploader
    mount_uploader :cpf_document, Regularization::DocumentUploader
    mount_uploader :civil_state_document, Regularization::DocumentUploader
    mount_uploader :income_document, Regularization::DocumentUploader
    mount_uploader :rg_document, Regularization::DocumentUploader
    mount_uploader :document_iptu, Regularization::DocumentUploader
    mount_uploader :document_onus, Regularization::DocumentUploader
    mount_uploader :document_address, Regularization::DocumentUploader


    validates :spouse_cpf_document,
              :spouse_rg_document, 
              file_size: { less_than_or_equal_to: 15.megabytes },
              file_content_type: { allow: ['image/jpeg', 'image/png','application/pdf', 'application/pdf-x'] },
              if: -> { [2,7].include?(self.civil_state_id) }

    validates :income_document,
              :cpf_document,
              :civil_state_document,
              :income_document,
              :rg_document,
              file_size: { less_than_or_equal_to: 15.megabytes },
              file_content_type: { allow: ['image/jpeg', 'image/png','application/pdf', 'application/pdf-x'] }

    validates :document_address, presence: true, file_size: { less_than_or_equal_to: 15.megabytes },
              file_content_type: { allow: ['image/jpeg', 'image/png','application/pdf', 'application/pdf-x'] }

  end
end 