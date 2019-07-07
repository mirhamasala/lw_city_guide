class City < ApplicationRecord
  has_many :spots

  validates :name, presence: true, uniqueness: true
  validates :country, :photo_url, presence: true
end
