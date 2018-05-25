class CreateMainTypeEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :main_type_events do |t|
      t.string :name
      t.boolean :status
      t.text :description

      t.timestamps
    end
  end
end
