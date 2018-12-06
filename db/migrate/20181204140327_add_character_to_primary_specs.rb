class AddCharacterToPrimarySpecs < ActiveRecord::Migration[5.2]
  def change
    add_reference :primary_specs, :character, foreign_key: true
  end
end
