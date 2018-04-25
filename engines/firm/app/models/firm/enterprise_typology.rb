module Firm
  class EnterpriseTypology < ActiveRecord::Base
    self.table_name = 'extranet.project_enterprise_typologies'

    belongs_to :enterprise, class_name: "Firm::Enterprise"
    belongs_to :typology, class_name: "Firm::Typology"

    has_many :units, class_name: "::Address::Unit"
  end
end
