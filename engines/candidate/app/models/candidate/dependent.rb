module Candidate
  class Dependent < ActiveRecord::Base
    self.table_name = "extranet.candidate_dependents"

    belongs_to :cadastre, class_name: "Candidate::Cadastre"
    belongs_to :kinship, class_name: "Candidate::Kinship"
    belongs_to :special_condition, class_name: "Candidate::SpecialCondition"
    belongs_to :civil_state, class_name: "Candidate::CivilState"

    enum gender: ['N/D', 'masculino', 'feminino']

  end
end
