class CreateCplCompetitionCompetitionUserCredentials < ActiveRecord::Migration[5.0]
  def change
    create_table 'competition.competition_user_credentials' do |t|
      t.integer :competition_user_id 
      t.string  :name 
      t.string  :cpf 
      t.string  :document 
      t.integer :credential_type, default: 0
      t.integer :regime_type, default: 0

      t.boolean :deleted, default: false 
      t.datetime :deleted_at 
       
      t.timestamps
    end
  end
end
