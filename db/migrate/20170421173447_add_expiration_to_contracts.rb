class AddExpirationToContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :expiration, :date
  end
end
