module CplCompetition
  class CompetitionEvent < ApplicationRecord
    self.table_name = 'competition.competition_events'


    belongs_to :user
  end
end
