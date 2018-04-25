module Concourse
  class Nav < ActiveRecord::Base
    self.table_name = "portal.concourse_navs"

    belongs_to :project
    belongs_to :page

    scope :actives, -> {where(:publish => true).order(:order)}

    enum :target  => [:_blank, :_self]
    enum :action => ['url', 'página']
    
  end
end