# frozen_string_literal: true

# CarsController
class CarsController < ApplicationController
  before_action :find_slot, only: %i[create]

  def new
    @car = Car.new
  end

  def create
    @car = @slot.create_car(car_params)
    if @car.save
      @slot.allocate
      redirect_to slot_path(@slot)
      flash[:notice] = 'slot booked'
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:register_number, :color)
  end

  def find_slot
    @slot = current_user.park_system.available_slots.first
  end
end
