class CreateIndeedRails < ActiveRecord::Migration[5.0]
  def change
    create_table :indeed_rails do |t|
      t.string :jobtitle
      t.string :company
      t.string :city
      t.string :state
      t.string :country
      t.string :source
      t.string :date
      t.string :link
      t.text   :snippet

      t.timestamps
    end
  end
end
