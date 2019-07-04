module CplCompetition
  class ExternalUser < CplCompetition::User
    default_scope { where(administrator: false)}

    attr_accessor :email_confirmation, :password_confirmation

    validates :cnpj, cnpj: true, presence: true
    validates :name, :telephone, :password, :password_confirmation, presence: true
    validates :email, :email_confirmation, email: true, presence: true
  end
end