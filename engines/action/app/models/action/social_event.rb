module Action
  class SocialEvent < ActiveRecord::Base
    self.table_name = 'portal.action_social_events'

    belongs_to :city, class_name: "Address::City"
    mount_uploader :thumb, Main::ThumbUploader
    mount_uploader :photo, Main::ThumbUploader
  end
end
