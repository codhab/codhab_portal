class AddCityIdToEntityOlds < ActiveRecord::Migration[5.0]
  def change
    add_column :entity_olds, :city_id, :integer
  end
end
