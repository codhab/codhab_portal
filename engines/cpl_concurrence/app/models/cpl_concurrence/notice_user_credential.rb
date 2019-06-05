module CplConcurrence
  class NoticeUserCredential < ActiveRecord::Base
    self.table_name = 'generic.cpl_concurrence_notice_user_credentials'

    enum credential_type: ['proprietário_ou_sócio','procurador']
  end
end