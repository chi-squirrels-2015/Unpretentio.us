class UrlsController < ApplicationController

  def show
  end

  def create
    @url = Url.new(origin: url_params[:origin], user: current_user)
    if @url.save
      redirect_to url_path(@url.uid)
    elsif @url.errors[:origin].any?
      existing_url = Url.find_by(origin: url_params[:origin])
      redirect_to url_path(existing_url.uid)
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

