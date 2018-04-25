module Concourse
  class Authorization
    include ActiveModel::Model

    attr_accessor :email, :password, :id

    validates :email,  presence: true
    validates :password, presence: true

    validate :authenticate

    private

    def authenticate
      @user = Concourse::UserProject.where(email: self.email, password: self.password, status: true, user_type: 1)

      if @user.present?
        self.id = @user.last.id
      else
        errors.add(:email, 'Email ou Senha inválidos, favor verificar')
      end
    end
  end
end
