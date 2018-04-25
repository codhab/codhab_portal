module Main
  class Report < ActiveRecord::Base
    self.table_name = 'extranet.wiki_bi_reports'
    scope :by_external,  -> (external) {where(external: true)}
  end
end
