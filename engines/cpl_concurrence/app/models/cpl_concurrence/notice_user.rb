module CplConcurrence
  class NoticeUser < ActiveRecord::Base
    self.table_name = 'generic.cpl_concurrence_notice_users'

    belongs_to :notice
    has_many   :user_documents, class_name: 'CplConcurrence::NoticeUserDocument', foreign_key: :notice_user_id
    
    validates_uniqueness_of :user_id, scope: :notice_id
  end
end