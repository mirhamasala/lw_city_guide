class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  # :validatable, :recoverable
  devise :database_authenticatable, :registerable,
  :rememberable, :omniauthable, omniauth_providers: %i[github]

  has_many :spots
  has_many :ratings, dependent: :destroy

  has_and_belongs_to_many :cities

  def city_keeper?
    cities.any?
  end

  def city_keeper_for?(city)
    cities.include?(city)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.nickname
      user.avatar = auth.info.image
      user.name = auth.info.name
      user.github_profile = auth.info.urls.GitHub
      user.bio = auth.extra.raw_info.bio
      user.location = auth.extra.raw_info.location
    end
  end
end
