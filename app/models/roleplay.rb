class Roleplay < ApplicationRecord
  has_one_has_attached :roleplay_image
  has_many :characters
  has_many :game_session
end
