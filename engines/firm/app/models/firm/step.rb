module Firm
  class Step < ActiveRecord::Base
    self.table_name = 'extranet.project_steps'

    belongs_to :enterprise, class_name: "Firm::Enterprise"
  end
end
