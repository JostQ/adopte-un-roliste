class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :opinions, :game_sessions_id, :game_session_id
  end
end
