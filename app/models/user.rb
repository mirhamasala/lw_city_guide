class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :spots
  has_many :ratings, dependent: :destroy

  has_and_belongs_to_many :cities
  # has_many :owners, class_name: "Spot", foreign_key: "spot_id"

  validates :github_handle, presence: true
end
