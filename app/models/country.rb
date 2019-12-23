class Country < ApplicationRecord
  has_many :cities
  validates :name, presence: true, uniqueness: true

  def self.alphabetize
    order(name: :asc)
  end
end
