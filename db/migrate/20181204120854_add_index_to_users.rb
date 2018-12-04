class AddIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :string
    add_index :users, :string
  end
end
