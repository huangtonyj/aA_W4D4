class SessionsController < ApplicationController

  def new
    user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = ["Wrong email and/or password"]
      render :new
    else
      log_in_user!(user)
      redirect_to users_url
    end
  end

  def destroy
    log_out_user!
    redirect_to new_session_url
  end


end
