class CreateCplCompetitionCompetitions < ActiveRecord::Migration[5.0]
  def change
    create_table 'competition.competitions' do |t|
      t.string :title
      t.string :number
      t.text   :content 
      t.text   :document_introduce
      
      t.datetime :publish_at
      t.datetime :participation_started_at
      t.datetime :participation_ended_at
      t.datetime :session_started_at
      t.datetime :resource_started_at
      t.datetime :resource_ended_at
      
      t.boolean  :publish, default: false
      t.integer  :user_id 

      t.timestamps
    end
  end
end
