class AddPlayersLimitToGameSession < ActiveRecord::Migration[5.2]
  def change
    add_column :game_sessions, :players_limit, :integer
  end
end
