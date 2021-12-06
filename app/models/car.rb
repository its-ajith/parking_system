class Car < ApplicationRecord
  has_one :slot
  has_one :park_system

	validates :register_number, presence: true, length: { maximum: 8}
	validates :color, presence: true, length: { maximum: 10}
end
