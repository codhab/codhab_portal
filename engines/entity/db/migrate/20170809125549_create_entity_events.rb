class CreateEntityEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :entity_events do |t|
      t.string :name
      t.date :date
      t.text :description
      t.text :content
      t.integer :situation
      t.string :photo
      t.boolean :status
      t.string :district
      t.references :city, index: true
      t.timestamps null: false
    end
  end
end
