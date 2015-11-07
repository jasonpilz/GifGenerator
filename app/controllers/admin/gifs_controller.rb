class Admin::GifsController < Admin::BaseController

  def new
  end

  def create
    #findorcreate params[:search]
    category = Category.find_or_create_by(title: params[:search])

    #hit Giphy API and get image url to store in gifs db at image_path
    query = params[:search]
    connection = Hurley::Client.new("http://api.giphy.com")
    response = connection.get("v1/gifs/search?q=#{query}&api_key=dc6zaTOxFJmzC")
    body = response.body
    parsed = JSON.parse(body, :symbolize_names => true)
    img_url = parsed[:data].sample[:images][:original].fetch(:url)

    @gif = category.gifs.create(image_path: img_url)
    redirect_to gif_path(@gif)
  end

end
