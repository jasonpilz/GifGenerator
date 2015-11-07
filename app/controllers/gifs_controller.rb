class GifsController < ApplicationController
  def show
    @gif = Gif.find(params[:id])
  end

  def index
    @gifs = Gif.all
  end
end
