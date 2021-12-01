class Slot < ApplicationRecord
  

  belongs_to :park_system
  belongs_to :car, optional:true

  def allocate(register_number, color)
    self.create_car(register_number: register_number,color: color)
    self.status = "allocated"
    self.save
  end

  def unallocate
    self.car_id = nil
    self.status = "unallocated"
    self.save
  end
  
  

end
