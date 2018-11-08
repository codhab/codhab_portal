class CreateConcourseCandidateRefunds < ActiveRecord::Migration[5.0]
  def change
    create_table 'portal.concourse_candidate_refunds' do |t|
      t.integer :candidate_id
      t.string  :account
      t.string  :operation
      t.string  :agency
      t.string  :second_name
      t.string  :second_cpf
      t.string  :status
      t.date    :refund_date
      t.integer :project_id
      t.integer :state_id
      t.integer :city_id
      t.string  :address
      t.integer :account_type_id
      t.integer :bank_number
      t.string  :bank_name

      t.timestamps
    end
  end
end
