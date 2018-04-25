class CreateMainPageCategories < ActiveRecord::Migration
  def change
    create_table :main_page_categories do |t|

      t.string :title
    	t.boolean :status
    	t.string :code, unique: true
      t.string :description

      t.timestamps null: false
    end
  end
end
