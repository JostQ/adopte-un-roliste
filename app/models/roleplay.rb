class Roleplay < ApplicationRecord
  has_one_attached :roleplay_picture
  has_many :characters
  has_many :game_session
end
