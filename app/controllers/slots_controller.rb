# frozen_string_literal: true

class SlotsController < ApplicationController
  def index
    @parksystem = current_user.park_system
    @slots = current_user.park_system.slots.all
    @slot =  current_user.park_system.available_slots.first
  end

  def edit
    @slot =  current_user.park_system.available_slots.first
  end

  def update
    @slot =  current_user.park_system.available_slots.first
    if params[:color] && params[:register_number] && @slot
      @slot.allocate(params[:color], params[:register_number])
      redirect_to slot_path(@slot)
      flash[:notice] = 'slot booked'
    else
      flash[:notice] = 'Sorry! All slots are full'
      render :edit
    end
  end

  def show
    @slot = Slot.find(params[:id])
  end
end
