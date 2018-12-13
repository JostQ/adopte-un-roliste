class Character < ApplicationRecord
  belongs_to :game_session, optional: true
  validates :name, uniqueness: true
  belongs_to :user
  belongs_to :roleplay
  has_many :primary_specs
  has_many :secondary_specs
  has_many :inventories
end
