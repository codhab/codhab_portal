class AddGroupParticipationToCandidateParticipation < ActiveRecord::Migration[5.0]
  def change
    add_column :concourse_candidate_participations, :group_participation, :string
  end
end
