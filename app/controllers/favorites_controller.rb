class FavoritesController < ApplicationController
  def new
  end

  def create
    gif = Gif.find(params[:gif_id])
    user = session[:user_id]
    fav = Favorite.find_or_create_by(user_id: user, gif_id: gif.id)
    redirect_to gifs_path
  end

  def destroy
    Favorite.delete(params[:id])
    redirect_to gifs_path
  end

end
