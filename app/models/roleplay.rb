class Roleplay < ApplicationRecord
  has_one_attached :roleplay_image
  has_many :characters
  has_many :game_session
end
