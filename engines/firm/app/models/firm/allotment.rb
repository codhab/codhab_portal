module Firm
  class Allotment < ActiveRecord::Base
    self.table_name = 'extranet.indication_allotments'

    belongs_to :step, -> { order(:id) }, class_name: "Firm::Step"

  end
end
