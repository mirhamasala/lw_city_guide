class City < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :spots

  validates :name, presence: true, uniqueness: true
  validates :country, presence: true
end
