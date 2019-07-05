module CplCompetition
  class Competition < ApplicationRecord
    self.table_name = 'competition.competitions'

    has_many :competition_events

    scope :published, -> {
      where(publish: true)
    }

    validates :title, :content, presence: true
    validates :publish_at, 
              :participation_started_at, 
              :participation_ended_at, 
              :session_started_at, 
              :document_introduce,
              presence: true,
              if: -> { is_published? }


    before_save :save_log 

    def session_opened?
      publish && session_started_at >= Time.now
    end

    def save_log
      
      event = competition_events.new(
        description: changes,
        content: changes,
        description: (new_record? ? "Edital criado" : "Edital editado"),
        user_id: user_id
      )

      event.save    
    end

    private

    def is_published?
      publish
    end

  end
end
