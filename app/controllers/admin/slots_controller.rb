# frozen_string_literal: true

module Admin
  # SlotsController
  class SlotsController < AdminController
    def show
      @slot = Slot.find(params[:id])
    end

    private

    def slot_params
      params.require(:slot).permit(:slot_number, :status)
    end
  end
end
