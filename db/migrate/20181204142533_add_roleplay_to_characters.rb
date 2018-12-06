class AddRoleplayToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_reference :characters, :roleplay, foreign_key: true
  end
end
