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
    self.slots.where status: "unallocated"
  end


  def find_by_color(color)
    byebug
  end
end
