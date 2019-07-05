class CreateCplCompetitionCompetitionUsers < ActiveRecord::Migration[5.0]
  def change
    create_table 'competition.competition_users' do |t|
      t.integer  :user_id
      t.integer  :competition_id
      t.integer  :value, default: 0
      t.boolean  :disabled, default: false
      t.datetime :disabled_at
      t.text     :disabled_justify
      t.integer  :disabled_user_id
      t.boolean  :internal, default: false
      
      t.timestamps
    end
  end
end
