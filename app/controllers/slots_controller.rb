# frozen_string_literal: true

# SlotsController
class SlotsController < ApplicationController
  before_action :find_slot, except: [:show]
  def index
    @parksystem = current_user.park_system
    @slots = current_user.park_system.slots.all
  end

  def edit
    @car = @slot.create_car
  end

  def update
    if params[:color] && params[:register_number] && @slot
      @car = @slot.create_car(register_number: params[:register_number], color: params[:color])
      if @car.save
        @slot.allocate
        redirect_to slot_path
        flash[:notice] = 'slot booked'
      else
        render :edit
      end
    end
  end

  def show
    @slot = Slot.find(params[:id])
  end

  private

  def find_slot
    @slot = current_user.park_system.available_slots.first
  end
end
