# frozen_string_literal: true

# SlotsController
class SlotsController < ApplicationController
  before_action :find_slot, except: [:show]
  def index
    @parksystem = current_user.park_system
    @slots = current_user.park_system.slots
  end

  def show
    @slot = Slot.find(params[:id])
  end

  private

  def find_slot
    @slot = current_user.park_system.available_slots.first
  end
end
