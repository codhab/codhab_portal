module Entity
  class Situation < ActiveRecord::Base
    self.table_name = 'extranet.entity_situations'

    belongs_to :situation_status
  end
end