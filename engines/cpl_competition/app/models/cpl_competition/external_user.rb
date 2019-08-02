module CplCompetition
  class ExternalUser < CplCompetition::User
    default_scope { where(administrator: false)}

    attr_accessor :email_confirmation, :password_confirmation

    validates :cnpj, cnpj: true, presence: true
    validates :name, :telephone, :password, :password_confirmation, presence: true
    validates :email, :email_confirmation, email: true, presence: true

    after_validation :set_confirmation, on: :create
    
    private

    def set_confirmation
      self.confirmation_token = Digest::SHA1.hexdigest([Time.now, rand].join)
    end
  end
end