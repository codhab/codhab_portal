module Main
  class Station < ActiveRecord::Base
    self.table_name = 'extranet.technical_assistance_stations'
    belongs_to :city, class_name: 'Address::City'
    has_many :responsibles
  end
end
