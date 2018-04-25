class AddGroupParticipationToConcourseWinners < ActiveRecord::Migration[5.0]
  def change
    add_column :concourse_winners, :group_participation, :string
  end
end
