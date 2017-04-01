class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :name
      t.text :text

      t.timestamps
    end
  end
end
