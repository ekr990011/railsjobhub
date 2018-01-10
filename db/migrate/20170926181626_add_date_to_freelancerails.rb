class AddDateToFreelancerails < ActiveRecord::Migration[5.0]
  def change
    add_column :freelancerails, :date, :string
  end
end
