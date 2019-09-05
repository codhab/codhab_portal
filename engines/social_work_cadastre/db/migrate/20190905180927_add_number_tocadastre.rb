class AddNumberTocadastre < ActiveRecord::Migration[5.0]
   def change
    add_column :social_work_cadastre_cadastres, :number, :integer
  end
end
