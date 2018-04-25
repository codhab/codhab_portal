module Candidate
  class Validation < ActiveRecord::Base
    self.table_name = "extranet.candidate_validations"

    belongs_to :occurrence_situation, class_name: "Candidate::OccurrenceSituation"

    enum occurrence_type: ['informação', 'pendência', 'pendência_impeditiva']

  end
end
