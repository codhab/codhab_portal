module Regularization
  class VitoriaRegularizationSession
    include ActiveModel::Model

    attr_accessor :name, :cpf, :born, :vitoria_regularization_id

    validates :name, :born, presence: true
    validates :cpf, cpf: true, presence: true
    validate  :validate_cpf

    def authenticate(session)
      return false unless valid?

      session[:vitoria_regularization_id] = self.vitoria_regularization_id
      
      true
    end

    private

    def validate_cpf
      vitoria_regularization = Regularization::VitoriaRegularization.find_by(cpf: self.cpf)

      if vitoria_regularization.nil?
        errors.add(:cpf, 'informando não possui solicitação.')
      else
        self.vitoria_regularization_id = vitoria_regularization.id 

        if self.born.present? && (vitoria_regularization.born != Date.parse(self.born))
          errors.add(:born, 'não é igual a informada na solicitação')
        end

        name_upcase = self.name.to_s.mb_chars.upcase
        vitoria_regularization_name = vitoria_regularization.name.to_s.mb_chars.upcase

        if name_upcase.similar(vitoria_regularization_name) < 80
          errors.add(:name, 'não é igual ao informado na solicitação')
        end
      end
    end
  end
end