module Cpl
  class NoticeParticipant < ActiveRecord::Base # :nodoc:
    self.table_name = 'generic.cpl_notice_participants'
    belongs_to :notice
    belongs_to :participant

    has_many :document_participant, class_name: '::Cpl::DocumentParticipant'
  end
end
