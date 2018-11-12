class AddAttchmentToCandidateRefunds < ActiveRecord::Migration[5.0]
  def change
    add_column 'portal.concourse_candidate_refunds', :attachment, :string
    add_column 'portal.concourse_candidate_refunds', :staff_id, :integer
  end
end
