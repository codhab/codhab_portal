module Address
  class NotaryOffice < ActiveRecord::Base
    self.table_name = "extranet.address_notary_offices"

    belongs_to :unit, class_name: "Address::Unit"
  end
end
