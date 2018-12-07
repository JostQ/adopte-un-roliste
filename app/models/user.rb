class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :characters
  has_many :own_sessions, class_name: "GameSession", foreign_key: "creator_id"
  has_many :roles
  has_many :game_sessions, through: :roles
end
