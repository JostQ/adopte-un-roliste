class AddGameSessionToRoles < ActiveRecord::Migration[5.2]
  def change
    add_reference :roles, :sessio, foreign_key: true
  end
end
