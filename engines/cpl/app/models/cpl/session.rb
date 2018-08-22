module Cpl
  class Session # :nodoc:
    include ActiveModel::Model

    attr_accessor :login, :password, :id

    validates :login, presence: true
    validates :password, presence: true

    validate :authenticate

    private

    def authenticate
      cpf = login if login.lstrip.length == 11
      cnpj = login if login.lstrip.length == 14

      @participant = cpf.present? ? Cpl::Participant.where(cpf: cpf, password: self.password) : Cpl::Participant.where(cnpj: cnpj, password: self.password)

      if @participant.present?
        self.id = @participant.last.id
      else
        errors.add(:login, 'login ou Senha inválidos, favor verificar')
      end
    end
  end
end
