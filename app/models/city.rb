class City < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :spots
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true
  validates :country, presence: true
  validates :photo, presence: true, unless: :remote_photo_url

  def self.alphabetize
    order(name: :asc)
  end
end
