module CplCompetition
  class CompetitionDocument < ApplicationRecord
    self.table_name = 'competition.competition_documents'
    attr_accessor :user_id

    belongs_to :competition

    validates :name, presence: true

    before_save :save_log
    
    
    def save_log
      
      event = competition.competition_events.new(
        description: changes,
        content: changes,
        description: (new_record? ? "Documento adicionado" : "Documento editado"),
        user_id: user_id
      )

      event.save    
    end

  end
end
