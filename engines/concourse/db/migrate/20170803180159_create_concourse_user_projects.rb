class CreateConcourseUserProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :concourse_user_projects do |t|
      t.string :email
      t.string :password
      t.boolean :status
      t.integer :user_type
      t.references :project, index: true

      t.timestamps
    end
  end
end
