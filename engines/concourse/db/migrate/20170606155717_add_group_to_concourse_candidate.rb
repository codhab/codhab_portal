class AddGroupToConcourseCandidate < ActiveRecord::Migration[5.0]
  def change
    add_column :concourse_candidates, :group, :text, array: true, default: []
  end
end
