module Candidate
  class CadastreActivity < ActiveRecord::Base
    self.table_name = "extranet.candidate_cadastre_activities"

    belongs_to :cadastre, class_name: "Candidate::Cadastre"

    enum type_activity:   ['simples', 'judicial','crítico', 'corretiva', 'sistema']

  end
end
