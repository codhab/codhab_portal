module Candidate
  class CadastreSituation < ActiveRecord::Base
    self.table_name = "extranet.candidate_cadastre_situations"

    belongs_to :cadastre, class_name: "Candidate::Cadastre"
    belongs_to :situation_status
  end
end
