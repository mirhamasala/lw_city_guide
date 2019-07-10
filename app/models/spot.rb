class Spot < ApplicationRecord
  gstgeocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader

  belongs_to :city
  belongs_to :user

  validates :name, :category, :description, :address, :city_id, presence: true
  validates :address, uniqueness: { scope: :city }
  # validates :name, uniqueness: { scope: :address,
    # message: "already exists on this address" }
end
