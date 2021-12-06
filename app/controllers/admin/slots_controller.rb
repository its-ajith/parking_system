# frozen_string_literal: true

class Admin::SlotsController < AdminController
  def index; end

  def edit
    @slot = current_user.park_system.available_slots.first
    @car = @slot.create_car
  end

  def update
    @slot = current_user.park_system.available_slots.first
    if params[:color] && params[:register_number]
      @car = @slot.create_car(register_number: params[:register_number], color: params[:color])
      if @car.save
        @slot.allocate
        redirect_to admin_slot_path
        flash[:notice] = 'slot booked'
      else
        render :edit
      end
    end
  end

  def show
    @slot = Slot.find_by(params[:id])
  end

  def destroy
    if @book.destroy
      redirect_to ''
    else
      render :index
    end
  end

  private

  def find_slot
    @slot = current_user.park_system.find(params[:id])
  end

  def slot_params
    params.require(:slot).permit(:slot_number, :status)
  end
end
