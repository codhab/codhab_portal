module Address
  class PrintAllotment < ActiveRecord::Base
    self.table_name = 'extranet.address_print_allotments'

    belongs_to :print_type, class_name: "Address::PrintType", foreign_key: :print_type_id

  end
end
