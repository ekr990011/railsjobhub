class Job < ApplicationRecord
  validates :title, :email, :description, presence: true

  default_scope {order(date: :desc)}
end
