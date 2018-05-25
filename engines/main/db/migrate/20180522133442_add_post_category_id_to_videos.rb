class AddPostCategoryIdToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :main_videos, :post_category_id, :integer
  end
end
