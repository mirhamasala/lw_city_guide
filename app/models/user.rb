class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  		:recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:github]

  has_many :spots
  has_many :ratings, dependent: :destroy

  has_and_belongs_to_many :cities

  validates :github_username, presence: true

  def self.find_for_github_oauth(auth)
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name")
    user_params[:github_username] = auth.info.nickname
    user_params[:github_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params = user_params.to_h
    
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.

    return user
  end

  def city_keeper?
    cities.any?
  end

  def city_keeper_for?(city)
    cities.include?(city)
  end


end


