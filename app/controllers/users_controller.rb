class UsersController < ApplicationController
  #, 'data-turbolinks-track' => true
#,'data-turbolinks-track' => true
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
      flash[:notice] = "Your profile was created. You are now one step closer to being recruited to play at the next level!"
      redirect_to user_path(@user)
    else
      flash[:error] = "First_name, last_name, city, state, and school fields cannot be empty."
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit!
  end

end