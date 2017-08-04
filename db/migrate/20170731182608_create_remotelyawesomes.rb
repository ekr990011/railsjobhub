class CreateRemotelyawesomes < ActiveRecord::Migration[5.0]
  def change
    create_table :remotelyawesomes do |t|

      t.string :job_link
      t.string :job_skills
      t.string :job_title
      t.string :job_company
      t.text :job_description
      
      t.timestamps
    end
  end
end
