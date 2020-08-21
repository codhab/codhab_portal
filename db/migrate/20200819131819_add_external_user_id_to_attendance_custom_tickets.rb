class AddExternalUserIdToAttendanceCustomTickets < ActiveRecord::Migration[5.0]
  def change
    add_column 'extranet.attendance_custom_tickets', :external_user_id, :integer
    add_column 'extranet.attendance_custom_tickets', :external, :boolean, default: false
    add_column 'extranet.attendance_custom_tickets', :external_validate, :boolean, default: false
    add_column 'extranet.attendance_custom_tickets', :external_validate_at, :datetime
  end
end
