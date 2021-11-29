class Admin::UsersController < AdminController

  def index
  end

  def new
    user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice]="Signup successful"
    else
      flash[:notice]="Please try again"
       redirect_to 'new_admin_user_path'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
