class AddAgencyNameToCandidateRefunds < ActiveRecord::Migration[5.0]
  def change
    add_column 'portal.concourse_candidate_refunds', :agency_name, :string
  end
end
