module CplCompetition
  class CompetitionUserParticipation < ApplicationRecord
    self.table_name = 'competition.competition_user_participations'

    enum partipation_type: ['documento', 'proposta']
    
    mount_uploader :document, ::CplCompetition::DocumentUploader

    validates :partipation_type, presence: true
    validates :document, file_size: { less_than_or_equal_to: 15.megabytes },
                     file_content_type: { allow: ['application/pdf'] }, presence: true
  
  
    after_commit :create_log 
    
    private

    def create_log
      log = ::CplCompetition::CompetitionUserLog.new
      log.competition_user_id = self.competition_user_id
      
      if self.documento?
        
        if self.deleted
          log.content = "Arquivo nº #{self.id} do envelope 1 foi removido pelo usuário"
        else 
          log.content = "Arquivo nº #{self.id} foi adicionado pelo usuário"
        end
        
        log.save
      end
      
      if proposta?
        if self.deleted
          log.content = "Arquivo nº #{self.id} do envelope 2 foi removido pelo usuário"
        else 
          log.content = "Arquivo nº #{self.id} foi adicionado pelo usuário"
        end
        
        log.save
      end
    end
  end
end
