class CreateMainNavCategories < ActiveRecord::Migration
  def change
    create_table :main_nav_categories do |t|
      t.string :name
      t.boolean :status
      t.string :description

      t.timestamps null: false
    end
  end
end
