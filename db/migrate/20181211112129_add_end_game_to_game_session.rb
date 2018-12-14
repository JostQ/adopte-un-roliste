class AddEndGameToGameSession < ActiveRecord::Migration[5.2]
  def change
    add_column :game_sessions, :end_game, :boolean, default: false
  end
end
