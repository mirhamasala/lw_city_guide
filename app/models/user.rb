class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :spots
  has_many :ratings, dependent: :destroy

  has_many :cities_users
  has_many :cities, through: :cities_users

  validates :github_handle, presence: true
end

