class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  # def self.for(user, spot)
  #   find_or_initialize_by(user: user, spot: spot)
  # end
end
