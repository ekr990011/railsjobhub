class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :email
      t.text :description
      t.string :logo
      t.date :expiration
      t.string :applyinfo

      t.timestamps
    end
  end
end
