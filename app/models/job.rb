class Job < ApplicationRecord
  validates :title, :email, :description, presence: true
end
