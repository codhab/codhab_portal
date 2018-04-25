module Candidate
  class Search
    include ActiveModel::Model 

    attr_accessor :cpf, :cadastre_id, :program


    validates :cpf, cpf: true, presence: true
    validate  :cpf_exists?

    private

    def cpf_exists?
      cadastre = http_support.get("/candidato/cadastros/#{self.cpf}/verificate") rescue nil
      
      if cadastre['data'].nil?
        errors.add(:cpf, "CPF não encontrado.")
      else 
        self.cadastre_id = cadastre['data']
      end
        
    end 

    def http_support
      server  = Rails.env.development? ? "http://localhost:3001" : "http://extranet.codhab.df.gov.br"
      HttpSupport.new(server, 'eed6a8780692be1675b1bd0f386ca8b0')
    end

  end
end