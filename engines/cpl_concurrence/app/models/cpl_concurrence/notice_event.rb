module CplConcurrence
  class NoticeEvent < ActiveRecord::Base
    self.table_name = 'generic.cpl_concurrence_notice_events'

    belongs_to :staff, class_name: "Core::Person::Staff"
    belongs_to :notice
    belongs_to :notice_user

  end
end