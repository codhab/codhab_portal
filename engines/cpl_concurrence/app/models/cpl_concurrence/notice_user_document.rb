module CplConcurrence
  class NoticeUserDocument < ActiveRecord::Base
    self.table_name = 'generic.cpl_concurrence_notice_user_documents'

    validates :document, presence: true
    validates :document, file_size: { less_than_or_equal_to: 25.megabytes },
                     file_content_type: { allow: ['image/jpeg', 'image/png', 
                                                  'application/pdf','application/zip',
                                                  'application/x-rar-compressed',
                                                  'application/x-7z-compressed',
                                                  'application/vnd.ms-excel',
                                                  'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                                                  'application/msword'
                                                 ] }

    mount_uploader :document, ::CplConcurrence::DocumentUploader

    after_commit :write_log
    
    
    private

    def write_log
      participation = CplConcurrence::NoticeUser.find_by(id: self.notice_user_id)
      notice = CplConcurrence::Notice.find_by(id: participation.notice_id)
      
      if self.deleted
        content = "Arquivo de proposta nº #{self.id} foi removido com uso de senha pessoal"
      else
        content = self.proposal? ? "Arquivo de proposta nº #{self.id} adicionado com uso de senha pessoal" : "Arquivo de documentação nº #{self.id} adicionado com uso de senha pessoal"
      end

      log = CplConcurrence::NoticeUserLog.new
      log.notice_id = notice.id
      log.user_id   = participation.user_id
      log.content   = content
      log.save
    end

  end
end