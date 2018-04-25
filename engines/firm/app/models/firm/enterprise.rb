module Firm
  class Enterprise < ActiveRecord::Base

    self.table_name = 'extranet.project_enterprises'

    has_many :enterprise_typologies, class_name: "Firm::EnterpriseTypology"
    has_many :enterprise_cadastres, class_name: "::Firm::EnterpriseCadastre"

    has_many :steps, class_name: "Firm::Step"
    has_many :allotments, class_name: "Firm::Allotment", through: :steps

    scope :actives, -> { where(status: true)}


  end
end
