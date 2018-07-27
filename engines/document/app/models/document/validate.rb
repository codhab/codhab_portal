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
      @certi = Core::Document::DataPrint.where(cpf: new_cpf, id: self.allotment_id).last unless  @certificate.present?
      allotment = @certificate.present? ? @certificate.allotment_id : @certi.allotment_id
      @allotment = Core::Document::Allotment.where('id = ? and data_document::date = ?', allotment, date).first
    
      if (@certificate.present? || @certi.present?) && @allotment.present?
        self.id = @certificate.present? ? @certificate.id : @certi.id
      else
        errors.add(:cpf, 'Dados inválidos ou certidão não assinada.')
      end
    end
  end
end
