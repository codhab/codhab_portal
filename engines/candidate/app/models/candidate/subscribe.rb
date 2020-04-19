module Candidate
  class Subscribe < ActiveRecord::Base
    self.table_name = 'sihab.candidate_subscribes'
    
    has_many :subscribe_dependents

    accepts_nested_attributes_for :subscribe_dependents, allow_destroy: true
    
    enum gender_id: ['masculino', 'feminino']
    
    validates :name,
              :gender_id,
              :rg,
              :rg_org,
              :rg_state_id,
              :born_state_id,
              :nacionality,
              :civil_state_id,
              :income,
              :celphone,
              :email,
              :cep,
              :state_id,
              :city_id,
              :address,
              :burgh,
              :address_number,
              :address_complement,
              presence: true

    validates :cpf, cpf: true, presence: true, uniqueness: true
  
    validates_date :born, before: :today, presence: true
    validates_date :rg_emission_date, before: :today, presence: true
    validates_date :arrival_df, before: :today, presence: true

    validates :special_condition_type_id, :cid, presence: true, if: -> { self.special_condition? }

    validate  :cpf_allow?

    private

    def cpf_allow?
      # habilitado, convocado, inscrito

      if ::Candidate::Subscribe.where(cpf: self.cpf).present?
        errors.add(:cpf, 'CPF já se encontra inscrito.')
      else

        cadastre = Core::Candidate::Cadastre.find_by(cpf: self.cpf)

        if !cadastre.nil?
          situation_cadastre = Core::Candidate::CadastreSituation.where(cadastre_id: cadastre.id).order(id: :asc).last

          if [4,54,67].include?(situation_cadastre.situation_status_id)
            errors.add(:cpf, 'não é possível realizar a inscrição do CPF, pois já se encontra Habilitado')
          end
          
          if 3 == situation_cadastre.situation_status_id)
            errors.add(:cpf, 'não é possível realizar a inscrição do CPF, pois já se encontra Convocado')
          end


          if 2 == situation_cadastre.situation_status_id)
            errors.add(:cpf, 'não é possível realizar a inscrição do CPF, pois já Inscrito')
          end

        end

      end

    end

  end
end