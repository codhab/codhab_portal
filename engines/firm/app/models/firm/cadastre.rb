module Firm
  class Cadastre < ActiveRecord::Base

    self.table_name = 'extranet.indication_cadastres'

    belongs_to :cadastre, class_name: "Candidate::Cadastre"
    belongs_to :pontuation, class_name: "Candidate::Pontuation"
    belongs_to :allotment, class_name: "Firm::Allotment"


  end
end
