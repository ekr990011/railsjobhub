class RemoveDateStartAndDateFinishFromFreelancescrape < ActiveRecord::Migration[5.0]
  def change
    remove_column :freelancescrapes, :date_start, :string
    remove_column :freelancescrapes, :date_finish, :string
  end
end
