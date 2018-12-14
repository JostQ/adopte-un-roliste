class AddCityToGameSession < ActiveRecord::Migration[5.2]
  def change
    add_column :game_sessions, :city, :string
  end
end
