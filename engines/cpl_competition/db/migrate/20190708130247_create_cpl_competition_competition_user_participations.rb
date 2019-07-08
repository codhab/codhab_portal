class CreateCplCompetitionCompetitionUserParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table 'competition.competition_user_participations' do |t|
      t.integer :competition_user_id
      t.string  :competition_document_id
      t.string  :document
      t.integer :partipation_type, default: 0
      
      t.boolean  :deleted, default: false 
      t.datetime :deleted_at
      
      t.timestamps
    end
  end
end
