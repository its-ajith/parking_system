# frozen_string_literal: true

module Admin
  # CarsController
  class CarsController < AdminController
    before_action :find_slot, except: [:new]
    skip_before_action :verify_authenticity_token

    def new
      @car = Car.new
    end

    def create
      @car = @slot.create_car(car_params)
      if @car.save
        @slot.allocate
        redirect_to admin_slot_path(@slot)
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
end
