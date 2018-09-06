module Entity
  class Authorization
    include ActiveModel::Model

    attr_accessor :cnpj, :password, :id, :old
    validates :cnpj,  presence: true
    validates :password, presence: true

    validate :authenticate

    private

    def authenticate
      @entity = Core::Entity::Cadastre.where(cnpj: self.cnpj, password: self.password, status: true)
      @entity_old = Core::Entity::Old.where(cnpj: self.cnpj, password: self.password)
      if @entity.present?
        self.old = false
        self.id = @entity.last.id
      elsif @entity_old.present?
        self.old = true
        self.id = @entity_old.last.id
      else
        errors.add(:cnpj, 'Login ou Senha inválidos, favor verificar')
      end
    end
  end
end
