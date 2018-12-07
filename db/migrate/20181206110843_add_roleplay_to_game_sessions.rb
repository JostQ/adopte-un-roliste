class AddRoleplayToGameSessions < ActiveRecord::Migration[5.2]
  def change
    add_reference :game_sessions, :roleplay, foreign_key: true
  end
end
