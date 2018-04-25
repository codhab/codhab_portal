class CreateEntitySliders < ActiveRecord::Migration[5.0]
  def change
    create_table :entity_sliders do |t|
      t.string :title
      t.string :photo
      t.boolean :status

      t.timestamps null: false
    end
  end
end
