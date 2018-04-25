module Entity
  class Member < ActiveRecord::Base
    self.table_name = 'extranet.entity_members'
  end
end