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
    end
    
    private
    def parksystem_params
      params.require(:park_system).permit(:name, :slot_count)
    end
    
end
