class AddCreaCauToTitular < ActiveRecord::Migration[5.0]
  def change
    add_column :social_work_cadastre_cadastre_titulars, :crea_cau, :boolean 
  end
end
