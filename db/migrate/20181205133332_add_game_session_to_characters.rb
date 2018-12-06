class AddGameSessionToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_reference :characters, :game_session, foreign_key: true
  end
end
