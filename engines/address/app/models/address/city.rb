module Address
  class City < ActiveRecord::Base
    self.table_name = "extranet.address_cities"

    belongs_to :state 

    has_many :cadin,    class_name: "Candidate::Cadin"
    has_many :agendas,  class_name: "RegularizationSchedule::Agenda"

    scope :federal_district, -> { joins(:state)
                                  .where('address_states.acronym = ?', 'DF')
                                  .order(:name) }

  end
end
