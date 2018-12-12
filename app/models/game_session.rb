class GameSession < ApplicationRecord
  validates :title, uniqueness: { scope: :end_game, -> { where(end_game: false) } }

  belongs_to :roleplay
  belongs_to :creator, class_name: "User"
  has_many :opinions
  has_many :roles
  has_many :users, through: :roles
end
