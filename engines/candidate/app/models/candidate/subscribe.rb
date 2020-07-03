module Candidate
  class Subscribe < ActiveRecord::Base
    self.table_name = 'sihab.candidate_subscribes'
    
    audited 

    attr_accessor :password_confirmation 

    belongs_to :state, class_name: 'Core::Address::State'
    belongs_to :city, class_name: 'Core::Address::City'
    belongs_to :work_city, class_name: 'Core::Address::City', foreign_key: :work_city_id
    belongs_to :work_state, class_name: 'Core::Address::State', foreign_key: :work_state_id
    belongs_to :rg_state, class_name: 'Core::Address::State', foreign_key: :rg_state_id
    belongs_to :born_state, class_name: 'Core::Address::State', foreign_key: :born_state_id
    belongs_to :civil_state, class_name: 'Core::Candidate::CivilState'
    belongs_to :special_condition_type, class_name: 'Core::Candidate::SpecialConditionType'

    has_many :subscribe_dependents, before_add: :set_nest

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

    validates :cpf, cpf: true, presence: true
    validates_numericality_of :cep, :celphone
    validates :telephone, numericality: true, allow_blank: true
    validates_date :born, before: :today, presence: true
    validates_date :rg_emission_date, before: :today, presence: true
    validates_date :arrival_df, before: :today, presence: true
    validates :terms_one, :terms_two, presence:true
    validates :special_condition_type_id, :cid, presence: true, if: -> { self.special_condition? }

    validates :password, :password_confirmation, presence: true, length: { minimum: 6, maximum: 24 }
    validate  :password_confirmation_is_valid 
    validate  :unique_cpf, on: :create
    validate  :cpf_allow?, on: :create

    def set_nest(item)
      item.subscribe ||= self
    end

    def income
      sprintf('%.2f', self[:income])
    end

    def total_income
      (self.income.to_f + self.subscribe_dependents.sum(:income))
    end

    private

    def unique_cpf
      cadastre_cpf = Candidate::Subscribe.find_by(cpf: self.cpf)

      if !cadastre_cpf.nil?
        errors.add(:cpf, "CPF já se encontra inscrito, para mais detalhes acesse o comprovante de inscrição")
      end

    end

    def password_confirmation_is_valid
      if self.password != self.password_confirmation
        errors.add(:password_confirmation, 'Confirmação não pode ser diferente da senha informada')
      end
    end

    def cpf_allow?
      # habilitado, convocado, inscrito

      if ::Candidate::Subscribe.where(cpf: self.cpf).present?
        errors.add(:cpf, 'CPF já se encontra inscrito.')
      else

        cadastre = Core::Candidate::Cadastre.find_by(cpf: self.cpf)

        if !cadastre.nil?
          situation_cadastre = Core::Candidate::CadastreSituation.where(cadastre_id: cadastre.id).order(id: :asc).last
          convocation = Core::Candidate::CadastreConvocation.where(cadastre_id: cadastre.id, status: true, convocation_id: [1410,1411,1516])

          if [4,54,67,68,70].include?(situation_cadastre.situation_status_id) && !convocation.present?
            errors.add(:cpf, 'não é possível realizar a inscrição do CPF, pois já se encontra Habilitado')
          end
          
          if [5,7,8,9,10,12].include?(situation_cadastre.situation_status_id)
            errors.add(:cpf, 'não é possível realizar a inscrição do CPF, pois já se encontra Contemplado')
          end

          if (3 == situation_cadastre.situation_status_id)
            errors.add(:cpf, 'não é possível realizar a inscrição do CPF, pois já se encontra Convocado')
          end


          if (2 == situation_cadastre.situation_status_id)
            errors.add(:cpf, 'não é possível realizar a inscrição do CPF, pois já Inscrito')
          end

        end

      end


    end

  end
end