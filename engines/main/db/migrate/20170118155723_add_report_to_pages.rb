class AddReportToPages < ActiveRecord::Migration
  def change
    add_column :main_pages, :report, :string
  end
end
