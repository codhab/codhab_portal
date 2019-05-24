module CplConcurrence
  class NoticeUserDocument < ActiveRecord::Base
    self.table_name = 'generic.cpl_concurrence_notice_user_documents'

    after_commit :write_log
    
    private

    def write_log
      participation = CplConcurrence::NoticeUser.find_by(id: self.notice_user_id)
      notice = CplConcurrence::Notice.find_by(id: participation.notice_id)

      log = CplConcurrence::NoticeUserLog.new
      log.notice_id = notice.id
      log.user_id   = participation.user_id
      log.content   = "Arquivo foi adicionado"
      log.save      
    end

  end
end