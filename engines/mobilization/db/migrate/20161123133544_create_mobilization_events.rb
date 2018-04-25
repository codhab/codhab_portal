class CreateMobilizationEvents < ActiveRecord::Migration
  def change
    create_table :mobilization_events do |t|
      t.string :name
      t.date :date
      t.text :description
      t.integer :situation
      t.string :photo
      t.boolean :status
      t.string :district
      t.references :city, index: true
      t.timestamps null: false
    end
  end
end
