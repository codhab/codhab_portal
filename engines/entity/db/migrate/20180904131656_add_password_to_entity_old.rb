class AddPasswordToEntityOld < ActiveRecord::Migration[5.0]
  def change
    add_column 'extranet.entity_olds', :password, :string
  end
end
