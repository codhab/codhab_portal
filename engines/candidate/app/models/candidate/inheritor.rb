module Candidate
  class Inheritor < ActiveRecord::Base
    self.table_name = "extranet.candidate_inheritors"

    belongs_to :cadastre, class_name: "Candidate::Cadastre"
    belongs_to :inheritor_type, class_name: "Candidate::InheritorType"
    belongs_to :civil_state, class_name: "Candidate::CivilState"

    scope :name_inheritor,  -> (name_inheritor) {where(name: name_inheritor)}
    scope :cpf,  -> (cpf) {where(cpf: cpf)}
    scope :type_inheritor,  -> (type_inheritor) {where(type_inheritor_id: type_inheritor)}

  end
end
