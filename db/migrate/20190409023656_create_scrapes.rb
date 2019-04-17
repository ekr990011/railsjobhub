class CreateScrapes < ActiveRecord::Migration[5.2]
  def change
    create_table :scrapes do |t|
      t.string :job_id
      t.string :title
      t.string :link
      t.datetime :date, index: true
      t.string :company
      t.string :location
      t.string :source
      t.string :skills, array: true
      t.text :description

      t.timestamps
    end
  end
end
