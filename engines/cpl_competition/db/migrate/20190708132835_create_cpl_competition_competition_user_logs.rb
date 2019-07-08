class CreateCplCompetitionCompetitionUserLogs < ActiveRecord::Migration[5.0]
  def change
    create_table 'competition.competition_user_logs' do |t|
      
      t.integer :competition_user_id
      t.text    :content

      t.timestamps
    end
  end
end
