module Concourse
  class Page < ActiveRecord::Base
    self.table_name = 'portal.concourse_pages'

    belongs_to :project

    extend FriendlyId

    friendly_id :title, use: :slugged

    validates_presence_of :title, :content
  end
end
