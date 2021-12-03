class UsersController < ApplicationController

  def index
  end

  def new
    user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to '/login'
      flash[:notice]="Signup successful"
    else
      flash[:notice]="invalid email_id or password!  *Note: your password should have 2-15 letters"
       render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :confirmation_password)
    end

end
