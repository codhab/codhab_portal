module Address
  class Document
    include ActiveModel::Model

    attr_accessor :cpf, :authenticate, :certificate_number

    validates :cpf, cpf: true, presence: true

    validates :authenticate,  presence: true
    validates :certificate_number,  presence: true, :on => :validate_show

  end
end
