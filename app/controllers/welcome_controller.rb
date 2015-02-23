class WelcomeController < ApplicationController
  def index
    @url = Url.new
  end
end
