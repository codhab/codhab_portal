module CplConcurrence
  class User < ActiveRecord::Base 
    self.table_name = 'generic.cpl_concurrence_users'

    attr_accessor :email_confirmation, :password_confirmation

    enum modality: [
      'LTDA',
      'ME EPP',
      'EIRELI',
      'S.A'
    ]

    validates :name, presence: true
    validates :cnpj, cnpj: true, presence: true, uniqueness: true
    validates :email, :email_confirmation, presence: true, email: true
    validates :password_confirmation, :password, length: { minimum: 6, maximum: 20}, presence: true

    validate  :password_equal
    validate  :email_equal

    private


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