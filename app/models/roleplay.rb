class Roleplay < ApplicationRecord
  has_many :characters
  has_many :game_session
end
