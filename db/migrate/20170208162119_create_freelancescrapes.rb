class CreateFreelancescrapes < ActiveRecord::Migration[5.0]
  def change
    create_table :freelancescrapes do |t|
      t.string :title
      t.string :href
      t.text :description
      t.string :bids
      t.string :skills
      t.string :date_start
      t.string :date_finish
      t.string :budget

      t.timestamps
    end
  end
end
