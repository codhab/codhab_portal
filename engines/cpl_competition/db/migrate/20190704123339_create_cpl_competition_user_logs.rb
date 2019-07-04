class CreateCplCompetitionUserLogs < ActiveRecord::Migration[5.0]
  def change
    create_table 'competition.user_logs' do |t|

      t.integer :user_id 
      t.text    :content
      
      t.timestamps
    end
  end
end
