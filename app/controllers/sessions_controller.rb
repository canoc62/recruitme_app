class SessionsController < ApplicationController

  def new
    user = User.new
  end

  def create
    #@user = User.new
    #@user = User.find_by(username: params[:username]) #checks to see if this user exists
    user = User.new
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) #then checks to see if password is valid for user
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