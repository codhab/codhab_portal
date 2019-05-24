module CplConcurrence
  class User < ActiveRecord::Base 
    self.table_name = 'generic.cpl_concurrence_users'

    attr_accessor :email_confirmation, :password_confirmation

    validates :name, presence: true
    validates :cpf, cpf: true, allow_blank: true
    validates :cnpj, cnpj: true, allow_blank: true
    validates :email, :email_confirmation, presence: true, email: true
    validates :password_confirmation, :password, length: { minimum: 6, maximum: 20}, presence: true

    validates_uniqueness_of :cpf, if: -> { self.cpf.present? }
    validates_uniqueness_of :cnpj, if: -> { self.cnpj.present? }

    validate  :cpf_cnpj
    validate  :password_equal
    validate  :email_equal

    private

    def cpf_cnpj
      if !self.cpf.present? && !self.cnpj.present?
        errors.add(:cpf, "não pode ficar em branco, ou preencha CNPJ")
        errors.add(:cnpj, "não pode ficar em branco, ou preenchar CPF")
      end      
    end

    def password_equal
      if self.password != self.password_confirmation
        errors.add(:password_confirmation, 'não é igual a senha informada')
      end
    end
    
    def email_equal
      if self.email != self.email_confirmation
        errors.add(:email_confirmation, 'não é igual ao e-mail informado')
      end
    end
  end
end