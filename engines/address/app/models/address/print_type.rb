module Address
  class PrintType < ActiveRecord::Base
    self.table_name = 'extranet.address_print_types'

    has_many :print_allotments, class_name: "Address::PrintAllotment"

  end
end
