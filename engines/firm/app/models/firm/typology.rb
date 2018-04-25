module Firm
  class Typology < ActiveRecord::Base
    self.table_name = 'extranet.project_typologies'

    has_many :enterprise_typologies, class_name: "Firm::EnterpriseTypology"
  end
end
