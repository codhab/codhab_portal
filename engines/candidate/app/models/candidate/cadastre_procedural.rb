module Candidate
  class CadastreProcedural < ActiveRecord::Base
    self.table_name = "extranet.candidate_cadastre_procedurals"

    belongs_to :cadastre, class_name: "Candidate::Cadastre"
    belongs_to :convocation, class_name: "Candidate::Convocation"
    belongs_to :procedural_status, class_name: "Candidate::ProceduralStatus"
    belongs_to :assessment, class_name: "Protocol::Assessment"

  end
end
