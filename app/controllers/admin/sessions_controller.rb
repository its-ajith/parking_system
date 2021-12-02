class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.password ==  Digest::SHA1.hexdigest(params[:password])
      session[:user_id] = user.id
      flash[:notice]="Login successful"
      redirect_to '/admin/park_systems'
    else
      flash[:notice]="Invalid Email or Password"
      redirect_to '/admin/sessions/new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice]="Logged Out"
    redirect_to '/admin/home/index'
  end
end
