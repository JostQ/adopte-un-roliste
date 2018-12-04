class AddIndexToGameSession < ActiveRecord::Migration[5.2]
  def change
    add_column :game_sessions, :string
    add_index :game_sessions, :string
  end
end
