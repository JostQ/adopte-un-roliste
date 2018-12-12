class GameSession < ApplicationRecord
  belongs_to :roleplay
  belongs_to :creator, class_name: "User"
  has_many :roles
  has_many :characters
  has_many :users, through: :roles
end
