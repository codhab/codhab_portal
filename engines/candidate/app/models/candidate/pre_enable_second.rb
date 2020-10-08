module Candidate
  class PreEnableComplete < ActiveRecord::Base
    self.table_name = 'extranet.pre_habilitados_2'
    
    
    scope :by_cpf, -> (cpf) {
      where(cpf: cpf.to_s.unformat_cpf)
    }

    def cadastre
      ::Candidate::Cadastre.find_by(cpf: self.cpf)
    end
  end
end