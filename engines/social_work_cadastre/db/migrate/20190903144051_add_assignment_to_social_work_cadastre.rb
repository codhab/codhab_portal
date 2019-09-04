class AddAssignmentToSocialWorkCadastre < ActiveRecord::Migration[5.0]
  def change
    add_column :social_work_cadastre_cadastres, :assignment, :integer
  end
end
