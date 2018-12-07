class CreateGameSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :game_sessions do |t|
      t.string :title
      t.text :description
      t.references :creator, index: true

      t.timestamps
    end
  end
end
