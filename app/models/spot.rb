class Spot < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader

  belongs_to :city
  belongs_to :user
  has_many :ratings, dependent: :destroy
  belongs_to :category

  validates :name, :category, :description, :address, :city_id, presence: true
  validates :address, uniqueness: { scope: :city }
  # validates :name, uniqueness: { scope: :address,
    # message: "already exists on this address" }

  def self.check_coordinates
    where.not(latitude: nil, longitude: nil)
  end

  def self.recent
    order(created_at: :desc) # Last spot created appears on top
  end

end
