class AddGameSessionToRoles < ActiveRecord::Migration[5.2]
  def change
    add_reference :roles, :game_session, foreign_key: true
  end
end
