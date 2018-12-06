class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :recipient, index: true
      t.references :sender, index: true
      t.timestamps
    end
  end
end
