class CreateMainBsbHabitations < ActiveRecord::Migration
  def change
    create_table :main_bsb_habitations do |t|
      t.string :title
      t.string :result_1
      t.string :result_2
      t.string :result_3
      t.string :result_4
      t.string :result_5
      t.string :result_6

      t.timestamps null: false
    end
  end
end
