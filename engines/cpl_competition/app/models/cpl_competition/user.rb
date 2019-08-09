module CplCompetition
  class User < ApplicationRecord
    self.table_name = 'competition.users'

    has_many :competition_users
    
    validates :cpf,  cpf: true, uniqueness: true, allow_blank: true
    validates :cnpj, cnpj: true, uniqueness: true, allow_blank: true
    
    def special_name
      if administrator?
        "#{self.name.upcase} (CODHAB)"
      else
        "#{self.name.upcase} (EMPRESA)"
      end
    end
  end
end
