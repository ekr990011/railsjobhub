class AddDescriptionlongToWeworkRails < ActiveRecord::Migration[5.0]
  def change
    add_column :wework_rails, :descriptionlong, :text
  end
end
