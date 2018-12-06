class AddCharacterToSecondarySpecs < ActiveRecord::Migration[5.2]
  def change
    add_reference :secondary_specs, :character, foreign_key: true
  end
end
