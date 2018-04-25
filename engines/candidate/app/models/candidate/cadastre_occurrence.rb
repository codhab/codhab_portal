module Candidate
  class CadastreOccurrence < ActiveRecord::Base
    self.table_name = "extranet.candidate_cadastre_occurrences"

    belongs_to :cadastre, class_name: "Candidate::Cadastre"
    belongs_to :occurrence_situation, class_name: "Candidate::OccurrenceSituation"
    belongs_to :validation, class_name: "Candidate::Validation"

  end
end
