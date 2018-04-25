module Address
  class OwnershipType < ActiveRecord::Base
    self.table_name = 'extranet.address_ownership_types'

    has_many :unit, class_name: "Address::Unit"
  end
end
