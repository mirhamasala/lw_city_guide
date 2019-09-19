class Category < ApplicationRecord
  validates_presence_of :name
  has_many :spots
end
