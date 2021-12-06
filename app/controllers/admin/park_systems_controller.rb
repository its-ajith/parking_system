# frozen_string_literal: true

class Admin::ParkSystemsController < AdminController
  before_action :find_parksystem, only: %i[show index show]
  def new
    @parksystem = current_user.create_park_system
  end

  def create
    @parksystem = current_user.create_park_system(parksystem_params)
    if @parksystem.save
      redirect_to admin_park_system_path(@parksystem)
    else
      render :new
    end
  end

  def show
    if params[:color]
      @slots = current_user.park_system.find_by_color(params[:color]['color'])
    elsif params[:register_number]
      @slots = current_user.park_system.find_by_register_number(params[:register_number])
    elsif params[:status] && (params[:status] == 'unallocated')
      @slots = current_user.park_system.available_slots
    elsif params[:status] && (params[:status] == 'allocated')
      @slots = current_user.park_system.booked_slots
    else
      @slots = current_user.park_system.slots
    end
    if params[:id] && (params[:status] == 'remove')
      current_user.park_system.remove_slot(params[:id])
    end
  end

  def index; end

  private

  def find_parksystem
    @parksystem = current_user.park_system
  end

  def parksystem_params
    params.require(:park_system).permit(:name, :slot_count)
  end
end
