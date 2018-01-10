class CreateStackJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :stack_jobs do |t|
      t.string :title
      t.string :link
      t.string :company
      t.string :skills
      t.string :date_posted

      t.timestamps
    end
  end
end
