class AddContentToEvents < ActiveRecord::Migration
  def change
    add_column :mobilization_events, :content, :text
  end
end
