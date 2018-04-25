class CreateMainActionSliders < ActiveRecord::Migration
  def change
    create_table :main_action_sliders do |t|
      t.string :thumbnail
      t.string :title
      t.boolean :status
      t.integer :order

      t.timestamps null: false
    end
  end
end
