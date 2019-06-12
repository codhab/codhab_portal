module CplConcurrence
  class Notice < ActiveRecord::Base
    self.table_name = 'generic.cpl_concurrence_notices'

    def participation_open?
      (session_started_at >= Time.now) && (participation_ended_at < Time.now)
    end

  end
end