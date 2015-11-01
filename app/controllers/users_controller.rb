class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :same_user, only: [:edit, :update]
  
  def index
    
  end

  def show
   
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Your profile was created. You are now one step closer to being recruited to play at the next level!"
      redirect_to user_path(@user)
    else
      flash[:error] = "First_name, last_name, username, city, state, and school fields cannot be empty. Username must be unique."
      render :new
    end
  end

  def edit
  
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your profile was updated!"
      redirect_to user_path(@user)
    else
      flash[:error] = "First_name, last_name, city, state, and school fields cannot be empty." #DRY
      render :edit
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit!
  end

  def set_user
    @user = User.find(params[:id])
  end

  def same_user
    if current_user != @user
      flash[:error] = "You must be logged into correct account."
      redirect_to root_path
    end
  end
end