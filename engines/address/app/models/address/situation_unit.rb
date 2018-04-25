module Address
  class SituationUnit < ActiveRecord::Base
    self.table_name = 'extranet.address_situation_units'

    has_many :unit, class_name: 'Address::Unit'



  end
end
