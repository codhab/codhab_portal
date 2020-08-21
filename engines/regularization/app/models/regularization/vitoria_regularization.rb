module Regularization
  class VitoriaRegularization < ActiveRecord::Base
    self.table_name = 'offboardx.form_itapoa_regularizations' 

    default_scope { where(category_id: 2)}

    belongs_to :unit, class_name: 'Address::Unit' 

    enum situation_id: {'candidato' => 1, 'codhab' => 2, 'deferido' => 3, 'indeferido' => 4}
    
    enum unit_characterist: { "vazio" => 1, "construído" => 2, "em_construção" => 3}

    enum unit_characterist_occupation: { "doado_pelo_GDF" => 1, "irregular" => 2, "alugado" => 3, "cedido" => 4, "comprado" => 5}

    enum unit_characterist_edification: { "alvenaria" => 1, "madeira" => 2, "madeirite" => 3, "outros" => 4}

    enum unit_characterist_room: { "de_01_a_03" => 1, "04_a_05" => 2, "mais de 05" => 3}
    
    enum unit_characterist_dweller: { "01_a_03" => 1, "04_a_07" => 2, "mais_de_07" => 3}
    
    enum unit_characterist_piped_water: { "CAESB" => 1, "água_gambiarra" => 2, "sem_água" => 3}
    
    enum unit_characterist_electricity: { "CEB" => 1, "energia_gambiarra" => 2, "sem_energia" => 3}
    
    enum unit_characterist_sewer: { "Esgoto_CAESB" => 1, "fossa" => 2, "não_tem" => 3}

    validates :cpf, cpf: true, presence: true
    validates_uniqueness_of :cpf, scope: :category_id
    validates :unit_id, presence: true

    validates :name, :rg, :naturality, :civil_state_id, :born, :income, :phone, presence: true
    validates :email, email: true, presence: true

    validates :declaration_negative, 
              :declaration_descriptive,
              :declaration_pacific,
              :terms_use,
              presence: true

    validates :unit_characterist, 
              :unit_characterist_occupation,
              :unit_characterist_edification,
              :unit_characterist_room,
              :unit_characterist_dweller,
              :unit_characterist_piped_water,
              :unit_characterist_electricity,
              :unit_characterist_sewer,
              presence: true

    validates :spouse_name,
              :spouse_rg,
              :spouse_born,
              :spouse_job,
              :spouse_income,
              presence: true,
              if: -> { spouse_present? }

    validates :declaration_occupation_quantity, presence: true, if: -> { !self.declaration_occupation? }

    validates :declaration_spouse_informal_activity_value, presence: true, if: -> { self.declaration_spouse_informal_activity }
    validates :declaration_informal_activity_value, presence: true, if: -> { self.declaration_informal_activity }


    validates :spouse_cpf, presence: true, cpf: true, if: -> { spouse_present? }

    validates :mother_name, presence: true, if: -> { !self.mother_unknown? }

    mount_uploader :document_rg, Regularization::DocumentUploader
    mount_uploader :document_cpf, Regularization::DocumentUploader
    mount_uploader :document_civil_state, Regularization::DocumentUploader
    mount_uploader :document_income, Regularization::DocumentUploader
    mount_uploader :document_spouse_income, Regularization::DocumentUploader
    mount_uploader :document_spouse_rg, Regularization::DocumentUploader
    mount_uploader :document_spouse_cpf, Regularization::DocumentUploader
    mount_uploader :document_occupation_time, Regularization::DocumentUploader
    mount_uploader :photo_unit_front, Regularization::DocumentUploader
    mount_uploader :photo_unit_inside_one, Regularization::DocumentUploader
    mount_uploader :photo_unit_inside_two, Regularization::DocumentUploader
    mount_uploader :document_address, Regularization::DocumentUploader
    mount_uploader :document_iptu, Regularization::DocumentUploader
    
    def declaration_informal_activity_value
      "%.2f" % self[:declaration_informal_activity_value] rescue 0  
    end

    def declaration_informal_activity_value=(value)
      self[:declaration_informal_activity_value] = value.to_s.gsub('.', '').gsub(',','.').to_f rescue 0
    end

    def declaration_spouse_informal_activity_value
      "%.2f" % self[:declaration_spouse_informal_activity_value] rescue 0 
    end

    def declaration_spouse_informal_activity_value=(value)
      self[:declaration_spouse_informal_activity_value] = value.to_s.gsub('.', '').gsub(',','.').to_f rescue 0
    end

    def spouse_income=(value)
      self[:spouse_income] = value.to_s.gsub('.', '').gsub(',','.').to_f rescue 0
    end

    def spouse_income
      "%.2f" % self[:spouse_income] rescue 0 
    end

    def income=(value)
      self[:income] = value.to_s.gsub('.', '').gsub(',','.').to_f rescue 0
    end
    
    def income
      "%.2f" % self[:income] rescue 0
    end

    def complete_address
      if self.unit.present?
        self.unit.complete_address
      else
        self[:complete_address]
      end 
    end
    
    def iptu_valid?(session)
      unit_address = ::Address::Unit.where.not(registration_iptu: nil, registration_iptu: '').find_by(registration_iptu: self.iptu_code)

      if !self.iptu_code.blank? && !unit_address.nil?
        self.unit_id = unit_address.id
        self.complete_address = unit_address.complete_address

        session[:unit_id] = self.unit_id
      else
        errors.add(:iptu_code, 'não encontrado, corrija ou pesquise')
      end

      true
    end

    private

    def spouse_present?
      [2,7].include?(self.civil_state_id)
    end

  end
end