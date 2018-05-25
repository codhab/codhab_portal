module Main
  class Video < ActiveRecord::Base
    self.table_name = 'portal.main_videos'

    belongs_to :post_category

  end
end
