module Firm
  class EnterpriseSituationAction < ActiveRecord::Base
    self.table_name = 'extranet.candidate_enterprise_situation_actions'

    belongs_to :cadastre , class_name: "::Candidate::Cadastre"
    belongs_to :enterprise, class_name: "Firm::Enterprise"
    belongs_to :indication_cadastre, class_name: "Firm::Cadastre"
    has_many :enterprise_cadastre_situations, class_name: "Firm::EnterpriseCadastreSituation"

  end
end
