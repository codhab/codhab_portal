module Cpl
  class Participant < ActiveRecord::Base # :nodoc:
    self.table_name = 'generic.cpl_participants'

    attr_accessor :password_confirmation

    validates :name, :email, presence: true
    validates :password, length: { minimum: 6 }, presence: true, confirmation: true
    validates :password_confirmation, presence: true
    validates :cpf, cpf: true, if: 'self.cpf.present?'
    validates :cnpj, cnpj: true, if: 'self.cnpj.present?'
    validates :cnpj, :cpf, presence: true, unless: 'self.cnpj.present? || self.cpf.present?'
    validate  :validate_unique

    private

    def validate_unique
      @participant_cpf = Cpl::Participant.where(cpf: self.cpf)
      @participant_cnpj = Cpl::Participant.where(cnpj: self.cnpj)

      if @participant_cpf.present? || @participant_cnpj.present?
        errors.add(:cpf, 'CPF ou CNPJ já cadastrado, faça o login ou recupere sua senha.')
      end
    end
  end
end
