# frozen_string_literal: true

class Slot < ApplicationRecord
  belongs_to :park_system
  belongs_to :car, optional: true

  def allocate
    if car.present?
      self.status = 'allocated'
      save
    end
  end

  def unallocate
    self.car_id = nil
    self.status = 'unallocated'
    save
  end

  def available
    Slot.all.where(status: 'allocated')
  end
end
