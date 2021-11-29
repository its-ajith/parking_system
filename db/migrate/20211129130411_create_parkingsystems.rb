class CreateParkingsystems < ActiveRecord::Migration[5.2]
  def change
    create_table :parkingsystems do |t|
      t.string :name , null: false
      t.integer :total_number_of_slots, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
