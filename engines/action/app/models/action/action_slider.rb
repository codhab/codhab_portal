module Action
  class ActionSlider < ActiveRecord::Base
    self.table_name = 'portal.main_action_sliders'

    mount_uploader :thumbnail, Main::ThumbnailUploader
  end
end
