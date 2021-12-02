class Admin::ParkSystemsController < AdminController

    def new  
    end
    
    def create
      @parksystem = current_user.create_park_system(parksystem_params)
      if @parksystem.save
        render :show
      else
        render :new
      end
    end
    
    def show 
      @parksystem = current_user.park_system
      @slots = current_user.park_system.slots.all
      
      if (params[:color])
        @slots= current_user.park_system.find_by_color(params[:color])
      end

    

        
      case (params.has_key?(:status))
      when (params[:status] == "unallocated")
        @slots= current_user.park_system.available_slots
      when (params[:status] == "allocated")
        @slots= current_user.park_system.booked_slots
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
