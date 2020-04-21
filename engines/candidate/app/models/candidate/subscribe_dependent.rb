module Candidate
  class SubscribeDependent < ActiveRecord::Base
    self.table_name = 'sihab.candidate_subscribe_dependents'

    audited

    belongs_to :subscribe
    belongs_to :kinship, class_name: 'Core::Candidate::Kinship', foreign_key: :kinship_id
    belongs_to :rg_state, class_name: 'Core::Address::State', foreign_key: :rg_state_id
    belongs_to :born_state, class_name: 'Core::Address::State', foreign_key: :born_state_id
    belongs_to :civil_state, class_name: 'Core::Candidate::CivilState'
    belongs_to :special_condition_type, class_name: 'Core::Candidate::SpecialConditionType'

    enum gender_id: ['masculino', 'feminino']
    
    validates :name, :income, presence: true
    validates :cpf, cpf: true, presence: true, if: :is_major?
    validates :rg, 
              :gender_id, 
              :born_state_id,
              :rg_org, 
              :rg_state_id, 
              :nacionality, 
              :civil_state_id, 
              :income, 
              :kinship_id, 
              presence: true

    validates_date :born, before: :today, presence: true
    validates_date :rg_emission_date, before: :today, presence: true
    validates :special_condition_type_id, :cid, presence: true, if: -> { self.special_condition? }
    
    validate :cpf_valid?

    def income
      sprintf('%.2f', self[:income])
    end

    private

    def cpf_valid?
      
      if subscribe.cpf.gsub('.','').gsub('-','') == self.cpf
        errors.add(:cpf, 'CPF não pode ser igual ao do titular')
      end
      
      if subscribe.subscribe_dependents.where(kinship_id: 6).count > 1
        errors.add(:kinship_id, 'já existe um cônjuge cadastrado')
      end

      if ![2,7].include?(self.subscribe.civil_state_id) && self.kinship_id == 6
        errors.add(:kinship_id, 'o cadastro do titular não é CASADO(A) ou UNIÃO ESTÁVEL.')
      end
    end
    
    def is_major?
      (age >= 14) 
    rescue
      true
    end

    def age
      ((Date.today - self.born).to_i / 365.25).to_i rescue I18n.t(:no_information)
    end
  end
end