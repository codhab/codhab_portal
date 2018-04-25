module Candidate
  class PasswordUpdate < ActiveRecord::Base
    self.table_name = "extranet.candidate_cadastres"

    attr_accessor :password_confirmation

    validates :password, :password_confirmation, length: { minimum: 6}
    validate  :password_eq

    private

    def password_eq
      errors.add(:password, "Senhas não são iguais") if self.password != self.password_confirmation
    end
  end
end