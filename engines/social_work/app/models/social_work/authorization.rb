module SocialWork
  class Authorization
    include ActiveModel::Model

    attr_accessor :username, :password, :id, :company_type

    validates :username,  presence: true
    validates :password, presence: true

    validate :authenticate

    private

    def authenticate
      @user = Core::SocialWork::CompanyUser.where(username: self.username, password: self.password, status: true)

      if @user.present?
        self.id = @user.last.id
        self.company_type =  @user.last.company.company_type
      else
        errors.add(:username, 'Login ou Senha inválidos, favor verificar')
      end
    end
  end
end
