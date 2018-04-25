module Main
  class Gallery < ActiveRecord::Base
    self.table_name = 'portal.main_galleries'

    mount_uploaders :photo, Main::ThumbUploader
    mount_uploader :thumbnail, Main::ThumbnailUploader
  end
end
