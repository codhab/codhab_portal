module Address
  class RegistryUnit < ActiveRecord::Base
    self.table_name = 'extranet.address_registry_units'
    
    belongs_to :unit, class_name: 'Address::Unit'

    enum situation: [:não, :em_fase, :sim]

  end
end
