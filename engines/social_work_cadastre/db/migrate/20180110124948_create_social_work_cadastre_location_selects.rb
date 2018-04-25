class CreateSocialWorkCadastreLocationSelects < ActiveRecord::Migration[5.0]
  def change
    create_table :social_work_cadastre_location_selects do |t|
      t.integer :location_id


      t.timestamps
    end
  end
end
