class CreateMainEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :main_events do |t|
      t.text :resume
      t.text :content
      t.integer :type_event_id
      t.date :date_publish
      t.string :title
      t.string :file_path
      t.boolean :status

      t.timestamps
    end
  end
end
