class City < ApplicationRecord
  mount_uploader :cover, CityCoverUploader

  has_many :spots

  has_many :cities_users
  has_many :keepers, through: :cities_users, source: :user

  validates :name, presence: true, uniqueness: true
  validates :country, presence: true
  validates :cover, presence: true

  def self.alphabetize
    order(name: :asc)
  end
end

# Find every place where I call city.users
