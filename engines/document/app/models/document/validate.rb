module Document
  class Validate # :nodoc:
    include ActiveModel::Model
    attr_accessor :cpf, :document_date, :allotment_id, :id

    validate :authenticate?

    def authenticate?
      return errors.add(:cpf, 'Dados inválidos ou certidão não assinada.') unless self.cpf.present? && self.document_date.present?
      date =  Date.parse(self.document_date)
      new_cpf = self.cpf.gsub('-','').gsub('.','')
      @certificate = Core::Document::DataPrint.where(cpf: new_cpf, allotment_id: self.allotment_id).last
      @allotment = Core::Document::Allotment.where('id = ? and data_document::date = ?', @certificate.allotment_id, date).first
      if @certificate.present? && @allotment.present?
        self.id = @certificate.id
      else
        errors.add(:cpf, 'Dados inválidos ou certidão não assinada.')
      end
    end
  end
end
