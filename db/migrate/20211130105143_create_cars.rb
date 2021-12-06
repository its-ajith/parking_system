# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :register_number
      t.string :color

      t.timestamps
    end
  end
end
