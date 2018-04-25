module Candidate
  class Session
    include ActiveModel::Model 

    attr_accessor :cpf, :password, :id

    validates :cpf, cpf: true, presence: true 
    validates :password, presence: true, length: { minimum: 6}

    validate :authenticate_candidate

    private

    def authenticate_candidate
      candidate = ::Candidate::Cadastre.where('password is not null')
                                       .where(cpf: self.cpf, password: self.password)
                                       .first
      if candidate.present?
        self.id = candidate.id
      else
        errors.add(:cpf, "CPF ou Senha estão incorretos.") 
      end
    end

    def http_support
      server  = Rails.env.development? ? "http://localhost:3001" : "http://extranet.codhab.df.gov.br"
      HttpSupport.new(server, 'eed6a8780692be1675b1bd0f386ca8b0')
    end

  end
end