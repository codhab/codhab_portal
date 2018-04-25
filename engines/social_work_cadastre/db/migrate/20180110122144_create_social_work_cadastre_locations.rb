class CreateSocialWorkCadastreLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :social_work_cadastre_locations do |t|
      t.integer :city_id
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
