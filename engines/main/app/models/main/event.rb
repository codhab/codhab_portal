module Main
  class Event < ApplicationRecord
    self.table_name = 'portal.main_events'
    
    belongs_to :type_event
  end
end
