class CreateMobilizationSliders < ActiveRecord::Migration
  def change
    create_table :mobilization_sliders do |t|
      t.string :title
      t.string :photo
      t.boolean :status

      t.timestamps null: false
    end
  end
end
