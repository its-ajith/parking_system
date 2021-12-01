class AdminController < ApplicationController
    before_action :authenticate_user 


    def authenticate_user
        if current_user == nil
            redirect_to '/admin/home/index'
        end
    end
   
    
end
