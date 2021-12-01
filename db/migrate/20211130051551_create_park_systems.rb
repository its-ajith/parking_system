class CreateParkSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :park_systems do |t|
      t.string :name, null: false
      t.integer :slot_count, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
