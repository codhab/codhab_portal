class CreateCplCompetitionCompetitionDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table 'competition.competition_documents' do |t|
      t.integer :competition_id
      t.string  :name 
      t.boolean :required, default: false
      t.boolean :status, default: true
      t.integer :user_id
      
      t.timestamps
    end
  end
end
