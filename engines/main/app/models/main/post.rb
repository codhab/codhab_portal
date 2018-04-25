module Main
  class Post < ActiveRecord::Base
    self.table_name =  'portal.main_posts'

    scope :by_title, -> (title) { where("title ILIKE concat('%', ?, '%')", title)}
    scope :by_category, -> (category) { where(post_category_id: category)}
    scope :by_publish,  -> (publish) {where(publish: publish)}
    
    belongs_to :post_category

    mount_uploader :thumb, Main::ThumbUploader
    mount_uploader :thumbnail, Main::ThumbnailUploader

  end
end
