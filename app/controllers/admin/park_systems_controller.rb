class Admin::ParkSystemsController < AdminController

    def new  
      @parksystem = current_user.create_park_system()
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
      @parksystem = current_user.park_system
      
      current_user.park_system.remove_slot(params[:id]) if (params[:id]) && (params[:status] == "remove")
      
      if (params[:color])      
        @slots= current_user.park_system.find_by_color(params[:color]['color'])
      elsif (params[:register_number])
        @slots= current_user.park_system.find_by_register_number(params[:register_number])
      elsif (params[:status]) && (params[:status] == "unallocated")
        @slots= current_user.park_system.available_slots

      elsif (params[:status]) && (params[:status] == "allocated")
        @slots= current_user.park_system.booked_slots
      else
        @slots = current_user.park_system.slots.all
      end
    end

    def index
      @parksystem = current_user.park_system
    end

    def destroy
      
    end

    
    
    private
    def parksystem_params
      params.require(:park_system).permit(:name, :slot_count)
    end
    
end
