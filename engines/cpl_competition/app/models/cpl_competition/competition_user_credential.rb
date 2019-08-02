module CplCompetition
  class CompetitionUserCredential < ApplicationRecord
    self.table_name = 'competition.competition_user_credentials'

    enum credential_type: ['sócio/proprietário', 'procuração']
    enum regime_type: ['EPP ME', 'LTDA', 'SA', 'EIRELI']

    mount_uploader :document, ::CplCompetition::DocumentUploader

    validates :document, file_size: { less_than_or_equal_to: 15.megabytes }, presence: true
  
  
    validates :name, :credential_type, :regime_type, :document, presence: true
    validates :cpf, cpf: true, presence: true

    after_commit :create_log 

    private

    def create_log
      log = ::CplCompetition::CompetitionUserLog.new
      log.competition_user_id = self.competition_user_id

      if deleted
        log.content = "Credenciamento realizado pelo usuário"
      else
        log.content = "Credenciamento cancelado pelo usuário"
      end

      log.save
    end
  end
end
