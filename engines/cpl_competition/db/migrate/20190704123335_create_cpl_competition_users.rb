class CreateCplCompetitionUsers < ActiveRecord::Migration[5.0]
  def change
    create_table 'competition.users' do |t|

      t.string   :name
      t.string   :cpf
      t.string   :cnpj
      t.string   :email
      t.string   :telephone
      t.string   :password
      
      t.boolean  :confirmation, default: false
      t.datetime :confirmation_at
      t.string   :confirmation_token
      t.string   :remember_token
      
      t.boolean  :administrator, default: false
      t.boolean  :only_view, default: false

      t.timestamps
    end

    add_index 'competition.users', :cpf,  unique: true
    add_index 'competition.users', :cnpj, unique: true
  end
end
