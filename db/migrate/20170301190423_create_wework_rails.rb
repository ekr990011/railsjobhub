class CreateWeworkRails < ActiveRecord::Migration[5.0]
  def change
    create_table :wework_rails do |t|
      t.string :company
      t.string :description
      t.string :date
      t.string :link

      t.timestamps
    end
  end
end
