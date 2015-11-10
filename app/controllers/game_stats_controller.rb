class GameStatsController < ApplicationController

  def new
    @game_stat = GameStat.new
    #@user = User.find(params[:id])
    # new_user_game_stat_path
    #render :new
  end

  def create
    #binding.pry
    @game_stat = GameStat.new(game_stat_params)
    @game_stat.user = current_user #Associates game_stat with logged in user
    #@user = User.find(params[:id])

    if @game_stat.save
      #binding.pry
      flash[:notice] = "Your statistics have been saved."
      redirect_to user_path(@game_stat.user)
    else
      flash[:error] = "There was an error in the submission."
      render :new
    end
  end

  def edit
    #@game_stat = GameStat.find(params[:id])
  end

  def update
    #@game_stat = GameStat.find(params[:id])
  end

  private

  def game_stat_params
    params.require(:game_stat).permit!
  end
end