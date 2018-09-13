class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save(user_params)
      log_in_user!(@user)
      redirect_to users_url
    else
      flash[:errors] = ["Invalid email/password"]
      redirect_to :new
    end
  end

  def index
    @user = current_user
    render :show
  end


  def user_params
    params.require(:user).permit(:email, :password)
  end

end
