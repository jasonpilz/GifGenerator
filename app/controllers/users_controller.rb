class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    current_user = User.find(session[:user_id])
    favorites = current_user.favorites
    gif_ids = favorites.map {|data| data.gif_id}
    @gifs = Gif.find(gif_ids)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
