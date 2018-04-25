module Candidate
  class CadastreAddress < ActiveRecord::Base
    self.table_name = "extranet.candidate_cadastre_addresses"

    belongs_to :cadastre, class_name: "Candidate::Cadastre"
    belongs_to :unit, class_name: "Address::Unit"

    enum situation_id:  ['reserva', 'distribuído', 'distrato','transferido', 'permuta','sobrestado']

  end
end
