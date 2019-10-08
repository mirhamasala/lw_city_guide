class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :github_handle, presence: true

  has_many :spots
  has_many :ratings, dependent: :destroy
  has_and_belongs_to_many :cities

  # User objects tend to become very big, so better to put it elsewhere
  # def community_manager_for?(city)
  #   city.community_manager == self # returns true if the current instance of the user is the community manager of the city
  # end
end
