class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :pseudo
      t.integer :level
      t.timestamps
    end
  end
end
