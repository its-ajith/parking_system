class ParkSystem < ApplicationRecord
  has_many :slots
  has_many :cars, through: :slots
  belongs_to :user, dependent: :destroy
  after_create :create_slots

  def create_slots
    self.slot_count.times do |i|
    self.slots.create(status:"unallocated")
    end

  end

  def available_slots
    self.slots.where(status: "unallocated")
  end

  def booked_slots
    self.slots.where(status: "allocated")
  end

  def remove_slot(id)
    Slot.where("id = ?", id).first.unallocate
  end


  def find_by_color(color)
    self.slots.joins(:car).select('slots.id', 'slots.status').where("color = ?",color)
  end

  def find_by_register_number(register_number)
    self.slots.joins(:car).select('slots.id', 'slots.status').where("register_number = ?", register_number)
  end
end
