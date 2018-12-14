class AddDateToGameSession < ActiveRecord::Migration[5.2]
  def change
    add_column :game_sessions, :date, :datetime
  end
end
