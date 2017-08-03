class CreateCareerbuilders < ActiveRecord::Migration[5.0]
  def change
    create_table :careerbuilders do |t|
      t.string :job_title
      t.text :job_description
      t.string :job_link
      t.string :job_date
      t.string :job_company

      t.timestamps
    end
  end
end
