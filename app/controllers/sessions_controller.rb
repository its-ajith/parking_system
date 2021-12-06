# frozen_string_literal: true

# SessionsController
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.password == Digest::SHA1.hexdigest(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Login successful'
      redirect_to '/admin/park_systems'
    else
      flash[:notice] = 'Invalid Email or Password'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    session.delete(:user_id)
    session.clear

    flash[:notice] = 'Logged Out'
    redirect_to '/admin/home/index'
  end
end
