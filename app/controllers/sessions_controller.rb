class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to gifs_path
    else
      flash[:invalid_login] = "Nope....that's not right. Try again."
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:logout] = "You've been logged out"
    redirect_to login_path
  end

end
