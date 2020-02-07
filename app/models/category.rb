class Category < ApplicationRecord
  has_many :spots
  validates :name, presence: true, uniqueness: true

  def self.alphabetize
    order(Arel.sql("CASE WHEN name = 'other' THEN 2 ELSE 1 END, name"))
  end
end
