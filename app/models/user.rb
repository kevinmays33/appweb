class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [ :google_oauth2 ]

  has_many :user_games
  has_many :games, through: :user_games

  def self.from_google(access_token)
    create_with(
      uid: access_token[:uid],
      provider: "google",
      password: Devise.friendly_token[0, 20]
    ).find_or_create_by!(email: access_token[:email])
  end
end
