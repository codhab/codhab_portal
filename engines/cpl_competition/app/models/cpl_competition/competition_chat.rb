module CplCompetition
  class CompetitionChat < ApplicationRecord
    self.table_name = "competition.competition_chats"

    belongs_to :user
    
    validates :content, presence: true
  end
end
