module Main
  class NavCategory < ActiveRecord::Base
    self.table_name = 'portal.main_nav_categories'

    has_many :navs, foreign_key: 'category_id'
  end
end
