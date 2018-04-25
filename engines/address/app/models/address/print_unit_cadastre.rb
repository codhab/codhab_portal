module Address
  class PrintUnitCadastre < ActiveRecord::Base
    self.table_name = 'extranet.address_print_unit_cadastres'

    belongs_to :cadastre, class_name: "Candidate::Cadastre"
    belongs_to :unit, class_name: "Address::Unit"
    belongs_to :current_unit, class_name: "Address::Unit"
    belongs_to :print_allotment, class_name: "Address::PrintAllotment"

  end
end
