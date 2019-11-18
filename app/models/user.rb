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

    repositories_json = open(auth.extra.raw_info.repos_url,
      "Accept" => "application/vnd.github.v3+json",
      "Authorization" => "token #{auth.credentials.token}"
    ).read
    repositories = JSON.parse(repositories_json)

    # Identify all the repositories' names of the user
    user_repos = repositories.map {|repo| repo["name"]}

    # Array containing all the repositories of a LW students
    lw_repos = [
      "fullstack-challenges", "rails-stupid-coaching", "dotfiles",
      "rails-longest-word-game", "rails-mister-cocktail", "rails-task-manager",
      "rails-yelp-mvp", "rails-wikinimous"
    ]
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    elsif (lw_repos & user_repos).length > 1 # Check if the user has at least one LW student repo
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    else
      return false
    end

    return user
  end

end


