class CreatePrimarySpecs < ActiveRecord::Migration[5.2]
  def change
    create_table :primary_specs do |t|
      t.string :name
      t.integer :value
      t.timestamps
    end
  end
end
