class CreateUpworkRails < ActiveRecord::Migration[5.0]
  def change
    create_table :upwork_rails do |t|
      t.string :title
      t.string :href
      t.text :description
      t.string :date

      t.timestamps
    end
  end
end
