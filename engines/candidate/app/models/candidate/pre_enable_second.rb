module Candidate
  class PreEnableSecond < ActiveRecord::Base
    self.table_name = 'extranet.pre_habilitados_2'
    
    
    scope :by_cpf, -> (cpf) {
      where(cpf: cpf.to_s.unformat_cpf)
    }

    scope :by_name, -> (name) {
      where("name ilike ?", "%#{name}%")
    }
    
    def cadastre
      ::Candidate::Cadastre.find_by(cpf: self.cpf)
    end
  end
end