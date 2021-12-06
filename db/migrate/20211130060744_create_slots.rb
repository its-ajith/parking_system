# frozen_string_literal: true

class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.string :status, null: false
      t.references :park_system, foreign_key: true
      t.references :car, foreign_key: true

      t.timestamps
    end
  end
end
