class Spot < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :city
  belongs_to :user
  has_many :ratings, dependent: :destroy


  validates :name, :category, :description, :address, :city_id, presence: true
  validates :address, uniqueness: { scope: :city }
  # validates :name, uniqueness: { scope: :address,
    # message: "already exists on this address" }
end
