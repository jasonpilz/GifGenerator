class GifsController < ApplicationController
  def show
    @gif = Gif.find(params[:id])
  end
end
