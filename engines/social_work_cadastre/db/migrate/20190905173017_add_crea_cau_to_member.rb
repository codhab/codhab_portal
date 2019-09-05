class AddCreaCauToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :social_work_cadastre_cadastre_members, :crea_cau, :boolean
  end
end
