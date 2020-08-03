module Regularization
  class ItapoaRegularizationSession
    include ActiveModel::Model

    attr_accessor :name, :cpf, :born, :itapoa_regularization_id

    validates :name, :born, presence: true
    validates :cpf, cpf: true, presence: true
    validate  :validate_cpf

    def authenticate(session)
      return false unless valid?

      session[:itapoa_regularization_id] = self.itapoa_regularization_id
      
      true
    end

    private

    def validate_cpf
      itapoa_regularization = Regularization::ItapoaRegularization.find_by(cpf: true)

      if itapoa_regularization.nil?
        errors.add(:cpf, 'informando não possui solicitação.')
      else
        self.itapoa_regularization_id = itapoa_regularization.id 

        if self.born.present? && (itapoa_regularization.born != Date.parse(self.born))
          errors.add(:born, 'não é igual a informada na solicitação')
        end

        name_upcase = self.name.to_s.mb_chars.upcase
        itapoa_regularization_name = itapoa_regularization.name.to_s.mb_chars.upcase

        if name_upcase.similiar(itapoa_regularization_name) < 80
          errors.add(:name, 'não é igual ao informado na solicitação')
        end
      end
    end
  end
end