class CreateCplCompetitionCompetitionChats < ActiveRecord::Migration[5.0]
  def change
    create_table 'competition.competition_chats' do |t|
      
      t.integer :competition_id
      t.text    :content
      t.integer :user_id 
      t.integer :target_id 
      t.integer :response_chat_id
      
      t.timestamps
    end
  end
end
