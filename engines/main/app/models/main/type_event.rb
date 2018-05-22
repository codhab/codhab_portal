module Main
  class TypeEvent < ApplicationRecord
    self.table_name = 'portal.main_type_events'
    has_many :event
  end
end
