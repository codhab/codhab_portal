module Firm
  class UserCompany < ActiveRecord::Base
    self.table_name = 'extranet.project_user_companies'

    belongs_to :company 
    
    attr_accessor :password_confirmation

    validates :name, :email, :login_user, presence: true
    validates :email, email: true
    validates :password, :password_confirmation, presence: true, length: { minimum: 6, maximum: 18}
    validate  :password_confirmation_equal?

    validates_uniqueness_of :login_user, scope: :company_id

    private

    def password_confirmation_equal?
      if self.password != self.password_confirmation
        errors.add(:password, 'As senhas não são iguais')
      end
    end
  end
end
