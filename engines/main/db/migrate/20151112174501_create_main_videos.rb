class CreateMainVideos < ActiveRecord::Migration
  def change
    create_table :main_videos do |t|
      t.string :title
      t.string :url
      t.integer :position
      t.boolean :publish
      t.text    :description

      t.timestamps null: false
    end
  end
end
