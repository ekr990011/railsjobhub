class AddExpirationToContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :expiration, :string
  end
end
