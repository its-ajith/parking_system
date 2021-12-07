# frozen_string_literal: true

# Slot
class Slot < ApplicationRecord
  belongs_to :park_system
  belongs_to :car, optional: true

  def allocate
    return unless car.present?

    self.status = 'allocated'
    save
  end

  def unallocate
    update(car_id: nil, status: 'unallocated')
  end
end
