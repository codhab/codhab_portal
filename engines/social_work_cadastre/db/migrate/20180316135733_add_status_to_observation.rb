class AddStatusToObservation < ActiveRecord::Migration[5.0]
  def change
    add_column :social_work_cadastre_observations, :status, :boolean
  end
end
