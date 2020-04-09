class Spot < ApplicationRecord
  enum status: { draft: 0, published: 1 }

  mount_uploader :photo, SpotPhotoUploader

  belongs_to :category
  belongs_to :city
  belongs_to :owner, class_name: "User"
  has_many :ratings, dependent: :destroy

  validates :name, :address, :city_id, :category_id, presence: true
  validates :description, presence: true, length: { minimum: 70 }
  validates :address, uniqueness: { scope: :city }
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.alphabetize
    order(name: :asc)
  end

  def self.check_coordinates
    where("latitude IS NOT NULL AND longitude IS NOT NULL")
  end

  def self.recent
    order(created_at: :desc) # Last spot created appears on top
  end

  def self.in_category(name)
    where(category: Category.where(name: name))
  end

  def self.in_city(city)
    where(city: city)
  end

  def rating_for(user)
    ratings.find_or_initialize_by(user: user)
  end

  def self.for_user(user)
    if user.admin?
      all
    elsif user.city_keeper?
      where(city: user.cities)
    else
      author?(user)
    end
  end

  def self.author?(user)
    where(owner: user)
  end

  def average_rating
    return nil unless ratings.pluck(:score).any?
    ratings.average(:score).to_i
  end
end
