class Scrape < ApplicationRecord

  default_scope {order(date: :desc)}
end
