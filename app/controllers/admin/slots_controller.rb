class Admin::SlotsController < AdminController

  
  def index

  end

  def edit
    @slot =  current_user.park_system.available_slots.first
    
  end

  def update
    @slot =  current_user.park_system.available_slots.first
    if (params[:color]) && (params[:register_number])
      @slot.allocate(params[:register_number], params[:color])
      redirect_to admin_slot_path
      flash[:notice]="slot booked"
    else
      flash[:notice]="Sorry! All slots are full"
       render :edit
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
