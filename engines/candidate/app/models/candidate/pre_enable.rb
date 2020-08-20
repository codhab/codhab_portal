module Candidate
  class PreEnable < ActiveRecord::Base
    self.table_name = 'extranet.pre_habilitados'
    
    
    scope :by_cpf, -> (cpf) {
      where(cpf: cpf.to_s.unformat_cpf)
    }

    def cadastre
      ::Candidate::Cadastre.find_by(cpf: self.cpf)
    end
  end
end