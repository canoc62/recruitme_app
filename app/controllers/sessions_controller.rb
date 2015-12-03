class SessionsController < ApplicationController

  def create
    user = User.new
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password]) 
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Incorrect username or password."
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are now logged out."
    redirect_to root_path
  end
end