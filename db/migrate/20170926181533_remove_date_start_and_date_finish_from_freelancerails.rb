class RemoveDateStartAndDateFinishFromFreelancerails < ActiveRecord::Migration[5.0]
  def change
    remove_column :freelancerails, :date_start, :string
    remove_column :freelancerails, :date_finish, :string
  end
end
