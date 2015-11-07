class GameStatsController < ApplicationController

  def new
    @game_stat = GameStat.new
    #@user = User.find(params[:id])
    # new_user_game_stat_path
    render :new
  end

  def create
    @game_stat = GameStat.new(game_stat_params)

    if @game_stat.save
      flash[:notice] = "Your statistics have been saved."
      redirect_to game_stat_show(@game_stat)
    else
      flash[:error] = "There was an error in the submission."
      render :new
    end
  end

  def edit
    @game_stat = GameStat.find(params[:id])
  end

  def update
    @game_stat = GameStat.find(params[:id])
  end

  private

  def game_stat_params
    params.require(:game_stat).permit!
  end
end