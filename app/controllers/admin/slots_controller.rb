class Admin::SlotsController < AdminController

  
  before_action do
    @parksystem = current_user.park_system.find params[:park_system_id]
  end


  def new
    @slot = @parksystem.slots.new
  end

  def create
    @slot = @parksystem.slots.create
  end

  def index

  end

  def show
  end

  def destroy
    if @book.destroy
      redirect_to ''
    else 
      render :index
  end

  
  private
  def find_slot
    @slot = current_user.park_system.find(params[:id])
  end

  def slot_params
    params.require(:slot).permit(:slot_number, :status)
  end
end
