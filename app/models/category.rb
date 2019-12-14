class Category < ApplicationRecord
  has_many :spots
  validates_presence_of :name

  def self.alphabetize
    order("CASE WHEN name = 'other' THEN 2 ELSE 1 END, name")
  end
end
