class GameSession < ApplicationRecord
  belongs_to :user
  belongs_to :roleplay
  has_and_belongs_to_many :users, through: :role
end
