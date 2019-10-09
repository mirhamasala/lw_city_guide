class Category < ApplicationRecord
  has_many :spots
  validates_presence_of :name
end
