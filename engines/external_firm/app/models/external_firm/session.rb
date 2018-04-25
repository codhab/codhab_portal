
module ExternalFirm
  class Session
    include ActiveModel::Model

    attr_accessor :email, :password, :id

    validates :email, email: true, presence: true
    validates :password, presence: true
    validate  :authenticate?

    private

    def authenticate?
      user = ExternalFirm::User.find_by(email: self.email) rescue nil

      if user.nil? || user.password != self.password
        errors.add(:email, "E-mail ou senha inválidos")
      else
        self.id = user.id
      end
    end

  end
end
