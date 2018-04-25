module Schedule
  class DataReference < ActiveRecord::Base
    self.table_name = "extranet.schedule_data_references"
    belongs_to :city, class_name: "Address::City", foreign_key: 'city_agenda_id'

    scope :city_agenda_id,   -> (value)   { where(city_agenda_id: value) }
    scope :block,   -> (value)   { where(block: value) }

    validates :cpf, cpf: true
  end
end
