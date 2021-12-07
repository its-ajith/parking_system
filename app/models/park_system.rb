# frozen_string_literal: true

# ParkSystem
class ParkSystem < ApplicationRecord
  has_many :slots
  has_many :cars, through: :slots
  belongs_to :user, dependent: :destroy
  after_create :create_slots

  validates :name, presence: true
  validates :slot_count, presence: true, numericality: true

  def create_slots
    slot_count.times do |_i|
      slots.create(status: 'unallocated')
    end
  end

  def available_slots
    slots.where(status: 'unallocated')
  end

  def booked_slots
    slots.where(status: 'allocated')
  end

  def remove_slot(id)
    Slot.find(id).unallocate
  end

  def find_by_color(color)
    slots.joins(:car).select('slots.id', 'slots.status').where('color = ?', color)
  end

  def find_by_register_number(register_number)
    slots.joins(:car).select('slots.id', 'slots.status').where('register_number = ?', register_number)
  end
end
