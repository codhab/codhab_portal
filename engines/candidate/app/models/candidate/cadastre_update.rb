module Candidate
  class CadastreUpdate < ActiveRecord::Base
    self.table_name = "extranet.candidate_cadastres"
    
    validates :telephone, :address, :city_id, :cep, presence: true
    validates :email, email: true, presence: true
  end
end