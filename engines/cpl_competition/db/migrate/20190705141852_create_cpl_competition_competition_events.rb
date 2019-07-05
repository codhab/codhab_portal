class CreateCplCompetitionCompetitionEvents < ActiveRecord::Migration[5.0]
  def change
    create_table 'competition.competition_events' do |t|
      t.integer :competition_id
      t.text    :description
      t.text    :content
      t.integer :event_type, default: 0 
      t.integer :user_id
      
      t.timestamps
    end
  end
end
