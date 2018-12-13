class AddCharacterToInventories < ActiveRecord::Migration[5.2]
  def change
    add_reference :inventories, :character, foreign_key: true
  end
end
