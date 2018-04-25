class CreateMainPosts < ActiveRecord::Migration
  def change
    create_table :main_posts do |t|

      t.string  :title
      t.text    :resume
      t.text    :content
      t.date    :date
      t.boolean :publish
      t.boolean :slider
      t.string  :thumb
      t.string  :photo_author
      t.string  :photo_description
      t.boolean :active_photo
      t.string  :author
      t.string  :link
      t.references :post_category, index: true
      t.string  :thumbnail
      t.string  :label_link
      t.string  :flickr
      t.string  :color
      t.integer :local_post



      t.timestamps null: false
    end
  end
end
