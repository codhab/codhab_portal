module CplCompetition
  class Session
    include ActiveModel::Model

    attr_accessor :cpf, :cnpj, :password, :session_type, :password, :id

    validates :cpf, cpf: true, presence: true,   if: :is_internal?
    validates :cnpj, cnpj: true, presence: true, if: :is_external?

    validate :authenticate

    def self.session_types
      {"Empresa" => "empresa", "CODHAB" => "codhab"}
    end

    def write_log(message)
      log = CplCompetition::UserLog.new
      log.user_id = self.id
      log.content = message
      log.save
    end
    
    def is_external?
      (self.session_type == 'empresa')
    end 
    
    def is_internal?
      (self.session_type == 'codhab')
    end

    private
    
    def authenticate
      
      case self.session_type
      when 'empresa'
        user = CplCompetition::ExternalUser.find_by(cnpj: self.cnpj)
        
        if user.nil? || (user.password != self.password)
          errors.add(:cnpj, "CNPJ ou senha inválidos")
        else
          self.id = user.id
        end
      when 'codhab'
        user = CplCompetition::InternalUser.find_by(cpf: self.cpf)

        if user.nil? || (user.password != self.password)
          errors.add(:cpf, "CPF ou senha inválidos")
        else
          self.id = user.id
        end
      else
        errors.add(:base, 'tipo de acesso inválido')
      end
    end
  end
end