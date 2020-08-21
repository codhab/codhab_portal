class CreateAttendanceExternalUsers < ActiveRecord::Migration[5.0]
  def change
    create_table 'extranet.attendance_external_users' do |t|
      t.string  :name
      t.string  :cpf
      t.string  :email
      t.string  :password_digest
      t.boolean :status, default: false
      t.text    :observation
      t.boolean :administrator, default: false
      t.integer :external_user_type_id

      t.timestamps
    end
  end
end
