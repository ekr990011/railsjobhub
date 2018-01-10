class CreateGithubs < ActiveRecord::Migration[5.0]
  def change
    create_table :githubs do |t|
      t.string :job_title
      t.string :job_link
      t.string :job_description
      t.string :job_apply
      t.string :job_company
      t.string :job_location
      t.date :job_date

      t.timestamps
    end
  end
end
