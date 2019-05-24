module CplConcurrence
  class Notice < ActiveRecord::Base
    self.table_name = 'generic.cpl_concurrence_notices'

    def proposal_open?
      start_at = Time.parse("#{self.proposal_start_date} #{self.proposal_start_hour}")
      ended_at = Time.parse("#{self.proposal_end_date} #{self.proposal_end_hour}")

      (start_at >= Time.now) && (ended_at < Time.now)
    end

    def document_open?
      start_at = Time.parse("#{self.document_start_date} #{self.document_start_hour}")
      ended_at = Time.parse("#{self.document_end_date} #{self.document_end_hour}")

      (start_at >= Time.now) && (ended_at < Time.now)
    end
  end
end