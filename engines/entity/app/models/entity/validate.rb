module Entity
  class Validate # :nodoc:
    include ActiveModel::Model

    attr_accessor :cnpj, :id

    validate :authenticate

    private

    def authenticate
      cnpj = self.cnpj.gsub('.','').gsub('-','').gsub('/','')
      @entity = Core::Entity::ValidateDocument.where(cnpj: cnpj)

      if @entity.present?
        self.id = @entity.last.id
      else
        errors.add(:cnpj, 'CNPJ incorreto ou inválido para esta ação.')
      end
    end
  end
end
