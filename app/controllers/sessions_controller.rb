class SessionsController < ApplicationController

  def index
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id]=user.id
      redirect_to "/classes"
    else
      flash[:errors] = ["Invalid User or Password"]
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to "/"
  end


end