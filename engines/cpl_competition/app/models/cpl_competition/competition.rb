module CplCompetition
  class Competition < ApplicationRecord
    self.table_name = 'competition.competitions'

    scope :published, -> {
      where(publish: true)
    }
  end
end
