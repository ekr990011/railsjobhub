class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :job_id
      t.string :title
      t.string :link
      t.datetime :date, index: true
      t.string :company
      t.string :location
      t.string :source
      t.string :skills, array: true
      t.text :description
      t.string :email
      t.integer :price

      t.timestamps
    end
  end
end
