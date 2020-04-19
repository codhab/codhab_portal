module Candidate
  class SubscribeDependent < ActiveRecord::Base
    self.table_name = 'sihab.candidate_subscribe_dependents'
    
    belongs_to :subscribe

    enum gender_id: ['masculino', 'feminino']
    
    validates :name, :income, presence: true
    validates :cpf, cpf: true, presence: true, if: :is_major?
    validates :born_state_id, 
              :gender_id, 
              :rg, 
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
    
    private

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