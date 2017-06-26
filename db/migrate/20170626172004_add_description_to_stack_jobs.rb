class AddDescriptionToStackJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :stack_jobs, :description, :text
  end
end
