class CreateSocialWorkCadastreCadastreStations < ActiveRecord::Migration[5.0]
  def change
    create_table :social_work_cadastre_cadastre_locations do |t|
      t.references :cadastre, index: true
      t.references :location, index: true

      t.timestamps
    end
  end
end
