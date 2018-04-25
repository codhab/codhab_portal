class CreateActionYearlyLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :action_yearly_links do |t|
      t.string :name
      t.string :file_link
      t.timestamps null: false
    end
  end
end
