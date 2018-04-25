module Person
  class Sector < ActiveRecord::Base
    self.table_name = 'extranet.person_sectors'

    has_many :staffs, foreign_key: "sector_current_id"

    belongs_to :father, class_name: "Person::Sector", foreign_key: 'father_id'
    belongs_to :responsible, class_name: "Person::Staff", foreign_key: 'responsible_id'
  end
end
