module Regularization
  class Request
    include ActiveModel::Model

    attr_accessor :city_id, :block, :group, :unit, :name, :cpf, :telephone, :telephone_optional, :email, :file , :description, :request


    validates :city_id, :block, :group, :unit, :name, :telephone, :description, presence: true
    validates :cpf, cpf: true, presence: true
    validates :email, email: true, presence: true
    validates :file, file_size: { less_than_or_equal_to: 20.megabytes },
                     file_content_type: { allow: ['image/jpeg', 'image/png','application/pdf', 'application/msword'] }, allow_blank: true
    
    validate :unique_cpf 

    def save
      return false if !valid?

      @request = Core::Regularization::Request.new(
        name: self.name,
        cpf: self.cpf,
        telephone: self.telephone,
        telephone_optional: self.telephone_optional,
        email: self.email,
        file: self.file,
        description: self.description,
        unit_id: self.unit
      )

      @request.save(validate: false)

      true
    end

    private 

    def unique_cpf
      if ::Core::Regularization::Request.where(cpf: self.cpf, unit_id: self.unit).present?
        errors.add(:cpf, "já possui recurso apresentado.")
      end
    end
  end
end
