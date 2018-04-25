class CreateMainGalleries < ActiveRecord::Migration
  def change
    create_table :main_galleries do |t|
      t.string :title
      t.text :content
      t.boolean :status
      t.string :thumbnail
      t.string :photo, array: true, default: []
      t.date   :date_publish
      t.boolean :private

      t.timestamps null: false
    end
  end
end
