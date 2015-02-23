class UrlsController < ApplicationController
  def index
  end

  def show
    
  end

  # def new
  #   @url = Url.new
  # end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to user_url_path(@url.uid)
    else
      # render 'new'
    end
  end

  private
  def url_params
    params.require(:url).permit(:origin)
  end

end

