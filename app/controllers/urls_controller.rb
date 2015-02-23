class UrlsController < ApplicationController

  def show
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to url_path(@url.uid)
    else
      redirect_to current_user
    end
  end

  def redirect
    url = Url.find_by(uid: params[:slug])
    redirect_to url.origin
  end

  private

  def get_url
    Url.find_by(uid: params[:slug])
  end

  def url_params
    params.require(:url).permit(:origin)
  end

end

