class Spot < ApplicationRecord
  validates :name, :description, :address, :city_id, :category_id, presence: true
  validates :address, uniqueness: { scope: :city }
  # validates :name, uniqueness: { scope: :address,
  # message: "already exists on this address" }

  belongs_to :category
  belongs_to :city
  has_many :ratings, dependent: :destroy
  belongs_to :owner, class_name: "User"

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader

  def self.check_coordinates
    where.not(latitude: nil, longitude: nil)
  end

  def self.recent
    order(created_at: :desc) # Last spot created appears on top
  end

  def self.in_category(name)
    where(category: Category.find_by(name: name))
  end

  def self.in_city(city)
    where(city: city)
  end

  def rating_for(user)
    ratings.find_or_initialize_by(user: user)
  end
end
