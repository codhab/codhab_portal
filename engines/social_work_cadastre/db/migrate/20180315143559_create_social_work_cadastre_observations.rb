class CreateSocialWorkCadastreObservations < ActiveRecord::Migration[5.0]
  def change
    create_table :social_work_cadastre_observations do |t|
      t.integer :cadastre_id
      t.text :observation

      t.timestamps
    end
  end
end
