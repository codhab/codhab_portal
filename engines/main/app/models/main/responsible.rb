module Main
  class Responsible < ActiveRecord::Base
    self.table_name = 'extranet.technical_assistance_responsibles'
    belongs_to :station
  end
end
