class Spot < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :city

  validates :name, :category, :description, :address, :city_id, presence: true
  validates :name, uniqueness: { scope: :address }
  # validates :name, uniqueness: { scope: :address,
    # message: "already exists on this address" }
end
