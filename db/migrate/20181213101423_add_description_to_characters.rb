class AddDescriptionToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :description, :text
  end
end
