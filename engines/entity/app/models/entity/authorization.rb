module Entity
  class Authorization
    include ActiveModel::Model

    attr_accessor :cnpj, :password, :id

    validates :cnpj,  presence: true
    validates :password, presence: true

    validate :authenticate

    private

    def authenticate
      @entity = Core::Entity::Cadastre.where(cnpj: self.cnpj, password: self.password, status: true)

      if @entity.present?
        self.id = @entity.last.id
      else
        errors.add(:cnpj, 'Login ou Senha inválidos, favor verificar')
      end
    end
  end
end
