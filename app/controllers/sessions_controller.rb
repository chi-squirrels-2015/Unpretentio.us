class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      @user = User.new
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
