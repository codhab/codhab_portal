module Main
  class Page < ActiveRecord::Base
    self.table_name = 'portal.main_pages'
    mount_uploader :thumb, Main::ThumbUploader
    mount_uploader :thumbnail, Main::ThumbnailUploader
  end
end
