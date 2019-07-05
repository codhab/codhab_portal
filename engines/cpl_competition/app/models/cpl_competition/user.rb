module CplCompetition
  class User < ApplicationRecord
    self.table_name = 'competition.users'

    has_many :competition_users
    
    validates :cpf,  uniqueness: true, allow_blank: true
    validates :cnpj, uniqueness: true, allow_blank: true
  end
end
