class AddDateToFreelancescrape < ActiveRecord::Migration[5.0]
  def change
    add_column :freelancescrapes, :date, :string
  end
end
