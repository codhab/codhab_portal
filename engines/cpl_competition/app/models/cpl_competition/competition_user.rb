module CplCompetition
  class CompetitionUser < ApplicationRecord
    self.table_name = 'competition.competition_users'
    
    belongs_to :competition
    belongs_to :user

    validates :competition_id, :user_id, presence: true
    validates_uniqueness_of :user_id, scope: :user_id

    validate  :competition_valid?

    private

    def competition_valid?
      #if !(competition.publish && competition.participation_started_at >= Time.now && competition.participation_ended_at < Time.now)
      #  errors.add(:competition_id, "Edital não liberado para participação")
      #end
      
      if user.administrator
        errors.add(:user_id, "Usuário interno não pode participar")
      end
    end

  end
end
