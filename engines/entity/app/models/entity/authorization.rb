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
<<<<<<< HEAD
      
=======
      @entity_old = Core::Entity::Old.where(cnpj: self.cnpj, password: self.password)
>>>>>>> 9e50a0d272af66f72a41f59d16daf8643e5fe0b0
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
