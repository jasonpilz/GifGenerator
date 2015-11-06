class Admin::GifsController < Admin::BaseController

  def new
  end

  def create
    #findorcreate params[:search]

    #hit Giphy API and get image url to store in gifs db at image_path
    query = params[:search]
    connection = Hurley::Client.new("http://api.giphy.com")
    response = connection.get("v1/gifs/search?q=#{query}&api_key=dc6zaTOxFJmzC")
    body = response.body
    parsed = JSON.parse(body, :symbolize_names => true)
    img_url = parsed[:data].first.fetch(:url)

    byebug
  end

  # connection = Hurley::Client.new("http://api.giphy.com")
  # response = connection.get("v1/gifs/search?q=#{query}&api_key=dc6zaTOxFJmzC")

end
