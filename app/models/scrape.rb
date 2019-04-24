class Scrape < ApplicationRecord
  include PgSearch

  pg_search_scope :search, against: [:title, :description, :source],
  using: {
    :tsearch => {:prefix => true, dictionary: "english"}
  }

  default_scope {order(date: :desc)}
end
