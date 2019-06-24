module CplConcurrence
  class Notice < ActiveRecord::Base
    self.table_name = 'generic.cpl_concurrence_notices'

    has_many :notice_users
    has_many :notice_chats
    has_many :notice_events

    def participation_open?
      (session_started_at >= Time.now) && (participation_ended_at < Time.now)
    end

  end
end