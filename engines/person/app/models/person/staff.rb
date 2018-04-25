module Person
  class Staff < ActiveRecord::Base
    self.table_name = 'extranet.person_staffs'
    
    belongs_to :sector_origin,   class_name: "Person::Sector"
    belongs_to :sector_current, class_name: "Person::Sector"
  end
end
