class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :edit_measurables, :update_measurables]
  before_action :same_user, only: [:edit, :update, :edit_measurables, :update_measurables]
  
  def show
  
  end

  def new
    if current_user
      flash[:error] = "You must be logged out to create another profile."
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Your profile was created. You are now one step closer to being recruited to play at the next level!"
      redirect_to user_path(@user)
    else
      flash[:error] = "First_name, last_name, username, city, state, school fields, and graduation year cannot be empty. Username must be unique."
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
      flash[:error] = "First_name, last_name, city, state, school fields, and graduation year cannot be empty." #DRY
      render :edit
    end
  end

  def edit_measurables
    if current_user
      render :edit_measurables
    else
      flash[:error] = "Please log in."
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :age, :height, :weight, :city, :state, :school, :gpa, :username, :email, :graduation_year, 
    :forty, :bench_press, :squat, :vertical, :broad_jump, :shuttle, :three_cone, :SAT, :ACT, position_ids: [])
  end

  def set_user
    @user = User.find(params[:id])
  end

end