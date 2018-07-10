module Certificate
  class Validation # :nodoc:
    include ActiveModel::Model
    attr_accessor :name, :document_date, :id, :cadastre_id

    validate :authenticate

    def authenticate
      date = Date.parse(self.document_date)

      @certificate = Certificate::Cadastre.where(name: self.name, allotment_id: self.id).last
      @allotment = Certificate::Allotment.where(id: self.id, main_authenticate_date: date).first

      if @certificate.present? && @allotment.present?
        self.cadastre_id = @certificate.id
      else
        errors.add(:name, 'Dados inválidos ou certidão não assinada.')
      end
    end
  end
end
